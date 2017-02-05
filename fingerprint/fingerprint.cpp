/*
 * Copyright (C) 2017 Jesse Chan <cjx123@outlook.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "SS Fingerprint HAL"

#include <cutils/log.h>

#include <hardware/hardware.h>
#include <hardware/fingerprint.h>
#include <utils/threads.h>

#include <dlfcn.h>

typedef struct {
    void *libhandle;
    int (*ss_fingerprint_close)(void);
    uint64_t (*ss_fingerprint_pre_enroll)(void);
    int (*ss_fingerprint_enroll)(const hw_auth_token_t *hat, uint32_t gid, uint32_t timeout_sec);
    int (*ss_fingerprint_post_enroll)(void);
    uint64_t (*ss_fingerprint_get_auth_id)(void);
    int (*ss_fingerprint_remove)(uint32_t gid, uint32_t fid);
    int (*ss_fingerprint_set_active_group)(uint32_t gid, const char *store_path);
    int (*ss_fingerprint_authenticate)(uint64_t operation_id, uint32_t gid);
    int (*ss_set_notify_callback)(fingerprint_notify_t notify);
    int (*ss_fingerprint_cancel)(void);
    int (*ss_fingerprint_open)(const char *id);
} bauth_server_handle_t;

bauth_server_handle_t* bauth_handle;

static fingerprint_notify_t original_notify;

static int load_bauth_server(void)
{
    bauth_handle = (bauth_server_handle_t *)malloc(sizeof(bauth_server_handle_t));
    if (bauth_handle == NULL) {
        return -1;
    }

    bauth_handle->libhandle = dlopen("libbauthserver.so", RTLD_NOW);
    *(void **)(&bauth_handle->ss_fingerprint_close) = dlsym(bauth_handle->libhandle,"ss_fingerprint_close");
    *(void **)(&bauth_handle->ss_fingerprint_pre_enroll) = dlsym(bauth_handle->libhandle,"ss_fingerprint_pre_enroll");
    *(void **)(&bauth_handle->ss_fingerprint_enroll) = dlsym(bauth_handle->libhandle,"ss_fingerprint_enroll");
    *(void **)(&bauth_handle->ss_fingerprint_post_enroll) = dlsym(bauth_handle->libhandle,"ss_fingerprint_post_enroll");
    *(void **)(&bauth_handle->ss_fingerprint_get_auth_id) = dlsym(bauth_handle->libhandle,"ss_fingerprint_get_auth_id");
    *(void **)(&bauth_handle->ss_fingerprint_remove) = dlsym(bauth_handle->libhandle,"ss_fingerprint_remove");
    *(void **)(&bauth_handle->ss_fingerprint_set_active_group) = dlsym(bauth_handle->libhandle,"ss_fingerprint_set_active_group");
    *(void **)(&bauth_handle->ss_fingerprint_authenticate) = dlsym(bauth_handle->libhandle,"ss_fingerprint_authenticate");
    *(void **)(&bauth_handle->ss_set_notify_callback) = dlsym(bauth_handle->libhandle,"ss_set_notify_callback");
    *(void **)(&bauth_handle->ss_fingerprint_cancel) = dlsym(bauth_handle->libhandle,"ss_fingerprint_cancel");
    *(void **)(&bauth_handle->ss_fingerprint_open) = dlsym(bauth_handle->libhandle,"ss_fingerprint_open");

    return 0;
}

static int fingerprint_close(hw_device_t *dev)
{
    (*bauth_handle->ss_fingerprint_close)();
    if (dev) {
        free(dev);
        return 0;
    } else {
        return -1;
    }
}

static void hal_notify_converted(const fingerprint_msg_t *msg)
{
    fingerprint_msg_t *new_msg = const_cast<fingerprint_msg_t *>(msg);

    switch (msg->type) {
        case FINGERPRINT_TEMPLATE_ENROLLING:
            new_msg->data.enroll.samples_remaining = 100 - msg->data.enroll.samples_remaining;
            break;

        default:
            break;
    }

    return original_notify(new_msg);
}

static uint64_t fingerprint_pre_enroll(struct fingerprint_device __unused *dev) {
    return (*bauth_handle->ss_fingerprint_pre_enroll)();
}

static int fingerprint_enroll(struct fingerprint_device __unused *dev,
                                const hw_auth_token_t *hat,
                                uint32_t gid,
                                uint32_t timeout_sec) {
    return (*bauth_handle->ss_fingerprint_enroll)(hat, gid, timeout_sec);
}

static int fingerprint_post_enroll(struct fingerprint_device __unused *dev) {
    return (*bauth_handle->ss_fingerprint_post_enroll)();
}

static uint64_t fingerprint_get_auth_id(struct fingerprint_device __unused *dev) {
    return (*bauth_handle->ss_fingerprint_get_auth_id)();
}

static int fingerprint_cancel(struct fingerprint_device __unused *dev) {
    return (*bauth_handle->ss_fingerprint_cancel)();
}

static int fingerprint_remove(struct fingerprint_device __unused *dev,
                                uint32_t gid, uint32_t fid) {
    return (*bauth_handle->ss_fingerprint_remove)(gid, fid);
}

static int fingerprint_set_active_group(struct fingerprint_device __unused *dev,
                                        uint32_t gid, const char *store_path) {
    return (*bauth_handle->ss_fingerprint_set_active_group)(gid, store_path);
}

static int fingerprint_authenticate(struct fingerprint_device __unused *dev,
                                    uint64_t operation_id, uint32_t gid) {
    return (*bauth_handle->ss_fingerprint_authenticate)(operation_id, gid);
}

static int set_notify_callback(struct fingerprint_device *dev,
                                fingerprint_notify_t notify) {
    /* Decorate with locks */
    dev->notify = notify;
    original_notify = notify;
    return (*bauth_handle->ss_set_notify_callback)(hal_notify_converted);
}

static int fingerprint_open(const hw_module_t* module, const char *id,
                            hw_device_t** device)
{
    if (device == NULL) {
        ALOGE("NULL device on open");
        return -EINVAL;
    }

    if (load_bauth_server() != 0)
    {
        return -EINVAL;
    }

    fingerprint_device_t *dev = (fingerprint_device_t*)calloc(1, sizeof(fingerprint_device_t));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = FINGERPRINT_MODULE_API_VERSION_2_0;
    dev->common.module = (struct hw_module_t*) module;
    dev->common.close = fingerprint_close;

    dev->pre_enroll = fingerprint_pre_enroll;
    dev->enroll = fingerprint_enroll;
    dev->post_enroll = fingerprint_post_enroll;
    dev->get_authenticator_id = fingerprint_get_auth_id;
    dev->cancel = fingerprint_cancel;
    dev->remove = fingerprint_remove;
    dev->set_active_group = fingerprint_set_active_group;
    dev->authenticate = fingerprint_authenticate;
    dev->set_notify = set_notify_callback;
    dev->notify = NULL;

    *device = (hw_device_t*) dev;
    return (*bauth_handle->ss_fingerprint_open)(id);
}

static struct hw_module_methods_t fingerprint_module_methods = {
    .open = fingerprint_open,
};

fingerprint_module_t HAL_MODULE_INFO_SYM = {
    .common = {
        .tag                = HARDWARE_MODULE_TAG,
        .module_api_version = FINGERPRINT_MODULE_API_VERSION_2_0,
        .hal_api_version    = HARDWARE_HAL_API_VERSION,
        .id                 = FINGERPRINT_HARDWARE_MODULE_ID,
        .name               = "Samsung TZ Fingerprint HAL",
        .author             = "Jesse Chan <cjx123@outlook.com>",
        .methods            = &fingerprint_module_methods,
    },
};
