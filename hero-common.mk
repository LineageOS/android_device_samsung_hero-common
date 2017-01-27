#
# Copyright (C) 2017 Fernando Von Arx <fer.vonarx@gmail.com>
# Copyright (C) 2017 Jesse Chan <cjx123@outlook.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/hero-common/overlay

LOCAL_PATH := device/samsung/hero-common

###########################################################
### RAMDISK
###########################################################

PRODUCT_PACKAGES += \
	fstab.samsungexynos8890 \
	init.samsung.rc \
	init.samsungexynos8890.rc \
	ueventd.samsungexynos8890.rc \

###########################################################
### PERMISSONS
###########################################################

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

###########################################################
### GRAPHICS
###########################################################

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

###########################################################
### POWER
###########################################################

PRODUCT_PACKAGES += \
	power.universal8890

###########################################################
### LIGHTS
###########################################################

PRODUCT_PACKAGES += \
	lights.universal8890

###########################################################
### CHARGER
###########################################################

# Offmode charger
# Use cm images if available, aosp ones otherwise
PRODUCT_PACKAGES += \
	charger_res_images \
	cm_charger_res_images

###########################################################
### MOBICORE
###########################################################

PRODUCT_PACKAGES += \
	libstlport \
	keystore.exynos5

###########################################################
### PACKAGES
###########################################################

PRODUCT_PACKAGES += \
	libsamsung_symbols \
	SamsungServiceMode \
	Torch

# Inherit board specific products
-include $(LOCAL_PATH)/product/*.mk

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos8890/exynos8890.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/hero-common/hero-common-vendor.mk)
