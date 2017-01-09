DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(DEVICE_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# Init Resources
PRODUCT_PACKAGES += \
	init.gps.rc

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
