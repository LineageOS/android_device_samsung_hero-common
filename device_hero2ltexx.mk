$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/hero2ltexx/hero2ltexx-vendor.mk)

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/hero2ltexx/overlay

LOCAL_PATH := device/samsung/hero2ltexx

###########################################################
### RAMDISK
###########################################################

PRODUCT_PACKAGES += \
	fstab.samsungexynos8890 \
	init.baseband.rc \
	init.carrier.rc \
	init.gps.rc \
	init.rilchip.rc \
	init.rilcommon.rc \
	init.samsung.rc \
	init.samsungexynos8890.rc \
	init.samsungexynos8890.usb.rc \
	init.sec.boot.sh \
	init.wifi.rc \
	ueventd.samsungexynos8890.rc \

###########################################################
### PERMISSONS
###########################################################

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

###########################################################
### GRAPHICS
###########################################################

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.opengles.version=196609 \
    ro.sf.lcd_density=560 \
    debug.hwc.force_gpu=1

PRODUCT_PACKAGES += \
	libion \
	libion_exynos \
	libfimg \
	gralloc.exynos5

###########################################################
### RADIO
###########################################################

# cpboot-daemon for modem
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ril/sbin/cbd:system/bin/cbd
   
PRODUCT_PACKAGES += \
    libxml2 \
    libprotobuf-cpp-full

PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap \
    modemloader
    
###########################################################
### WIFI
###########################################################

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    macloader \
    wifiloader \
    hostapd \
    libwpa_client \
    wpa_supplicant

# hardware/broadcom/wlan/bcmdhd/config/Android.mk
PRODUCT_PACKAGES += \
    dhcpcd.conf

# external/wpa_supplicant_8/wpa_supplicant/wpa_supplicant_conf.mk
PRODUCT_PACKAGES += \
    wpa_supplicant.conf


###########################################################
### BLUETOOTH
###########################################################

#~ PRODUCT_COPY_FILES += \
#~ 	$(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
#~ 	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

###########################################################
### NFC
###########################################################

#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
#	$(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-brcm.conf \
#	$(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

#PRODUCT_PACKAGES += \
#	com.android.nfc_extras \
#	libnfc_nci_jni \
#	libnfc-nci \
#	NfcNci \
#	Tag

#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.nfc.sec_hal=true

###########################################################
### AUDIO
###########################################################

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio.primary.universal8890
	
###########################################################
### OMX/MEDIA
###########################################################

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

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
### GPS
###########################################################

#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
#	$(LOCAL_PATH)/configs/gps/SuplRootCert:system/etc/SuplRootCert \
#	$(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

#PRODUCT_PACKAGES += \
#    libdmitry

###########################################################
### FINGERPRINT
###########################################################

#~ PRODUCT_PACKAGES += \
#~     fingerprintd \
#~     fingerprint.universal8890 \
#~     ValidityService

###########################################################
### CAMERA
###########################################################

PRODUCT_PACKAGES += \
	Snap

###########################################################
### TOUCHSCREEN
###########################################################

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/idc/ft5x06_ts.idc:/system/usr/idc/ft5x06_ts.idc \
	$(LOCAL_PATH)/idc/Synaptics_HID_TouchPad.idc:/system/usr/idc/Synaptics_HID_TouchPad.idc \
	$(LOCAL_PATH)/idc/Synaptics_RMI4_TouchPad_Sensor.idc:/system/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc

###########################################################
### CHARGER
###########################################################

# Offmode charger
# Use cm images if available, aosp ones otherwise
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images

###########################################################
### MTP
###########################################################

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

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

# Default.prop overrides to get adb working at boot   
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
	ro.hardware=universal8890 \
    persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	ro.securestorage.support=false \


# System properties
-include $(LOCAL_PATH)/system_prop.mk

$(call inherit-product-if-exists, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)
# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos8890/exynos8890.mk)

PRODUCT_NAME := full_hero2ltexx
PRODUCT_DEVICE := hero2ltexx
