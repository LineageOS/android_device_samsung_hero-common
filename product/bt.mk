# Init Resources
PRODUCT_PACKAGES += \
	init.bluetooth.rc

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path="/efs/bluetooth/bt_addr"

# Bluetooth workaround:
# The new CAF code defaults to MCT HAL, but we
# need the old H4 HAL for our Broadcom WiFi.
PRODUCT_PROPERTY_OVERRIDES += \
	qcom.bluetooth.soc=rome
