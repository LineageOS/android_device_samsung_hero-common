#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "log.h"
#include "property_service.h"
#include "util.h"
#include "vendor_init.h"

#include "init_sec.h"

std::string bootloader;
std::string device;
char* devicename;

device_variant check_device_and_get_variant()
{
    bootloader = property_get("ro.bootloader");
    return match(bootloader);
}

void vendor_load_properties()
{
    device_variant variant = check_device_and_get_variant();

    switch (variant) {
        case G930F:
            /* heroltexx */
            property_set("ro.build.fingerprint", "samsung/heroltexx/herolte:7.0/NRD90M/G930FXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "heroltexx-user 7.0 NRD90M G930FXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G930F");
            property_set("ro.product.device", "heroltexx");
            break;
        case G930W8:
            /* heroltebmc */
            property_set("ro.build.fingerprint", "samsung/heroltebmc/herolte:7.0/NRD90M/G930W8XXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "heroltebmc-user 7.0 NRD90M G930W8XXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G930W8");
            property_set("ro.product.device", "heroltebmc");
            break;
        case G930S:
            /* herolteskt */
            property_set("ro.build.fingerprint", "samsung/herolteskt/herolte:7.0/NRD90M/G930SXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "herolteskt-user 7.0 NRD90M G930SXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G930S");
            property_set("ro.product.device", "herolteskt");
            break;
        case G930K:
            /* heroltektt */
            property_set("ro.build.fingerprint", "samsung/heroltektt/herolte:7.0/NRD90M/G930KXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "heroltektt-user 7.0 NRD90M G930KXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G930K");
            property_set("ro.product.device", "heroltektt");
            break;
        case G930L:
            /* heroltelgt */
            property_set("ro.build.fingerprint", "samsung/heroltelgt/herolte:7.0/NRD90M/G930LXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "heroltelgt-user 7.0 NRD90M G930LXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G930L");
            property_set("ro.product.device", "heroltelgt");
            break;
        case G935W8:
            /* hero2ltebmc */
            property_set("ro.build.fingerprint", "samsung/hero2ltebmc/hero2lte:7.0/NRD90M/G935W8XXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "hero2ltebmc-user 7.0 NRD90M G935W8XXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G935W8");
            property_set("ro.product.device", "hero2ltebmc");
            break;
        case G935S:
            /* hero2lteskt */
            property_set("ro.build.fingerprint", "samsung/hero2lteskt/hero2lte:7.0/NRD90M/G935SXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "hero2lteskt-user 7.0 NRD90M G935SXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G935S");
            property_set("ro.product.device", "hero2lteskt");
            break;
        case G935K:
            /* hero2ltektt */
            property_set("ro.build.fingerprint", "samsung/hero2ltektt/hero2lte:7.0/NRD90M/G935KXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "hero2ltektt-user 7.0 NRD90M G935KXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G935K");
            property_set("ro.product.device", "hero2ltektt");
            break;
        case G935L:
            /* hero2ltelgt */
            property_set("ro.build.fingerprint", "samsung/hero2ltelgt/hero2lte:7.0/NRD90M/G935LXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "hero2ltelgt-user 7.0 NRD90M G935LXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G935L");
            property_set("ro.product.device", "hero2ltelgt");
            break;
        default: /* G935F */
            /* hero2ltexx */
            property_set("ro.build.fingerprint", "samsung/hero2ltexx/hero2lte:7.0/NRD90M/G935FXXU1ZPLH:user/release-keys");
            property_set("ro.build.description", "hero2ltexx-user 7.0 NRD90M G935FXXU1ZPLH release-keys");
            property_set("ro.product.model", "SM-G935F");
            property_set("ro.product.device", "hero2ltexx");
            break;
    }

    device = property_get("ro.product.device");
    INFO("Found bootloader id %s setting build properties for %s device\n", bootloader.c_str(), device.c_str());
}
