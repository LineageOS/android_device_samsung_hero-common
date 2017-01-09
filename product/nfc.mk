DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
	$(DEVICE_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-brcm.conf \
	$(DEVICE_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

# Packages
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	NfcNci \
	Tag

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.nfc.sec_hal=true \
	ro.nfc.port="I2C"
