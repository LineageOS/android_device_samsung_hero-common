DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
        $(DEVICE_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml

# Init Resources
PRODUCT_PACKAGES += \
	init.baseband.rc \
	init.baseband.sh \
	init.rilchip.rc \
	init.rilcommon.rc

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.multisim.simslotcount=2 \
	rild.libpath=/system/lib64/libsec-ril.so \
	rild.libpath2=/system/lib64/libsec-ril-dsds.so
