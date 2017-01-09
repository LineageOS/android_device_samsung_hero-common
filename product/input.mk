DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(DEVICE_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(DEVICE_PATH)/configs/idc/ft5x06_ts.idc:system/usr/idc/ft5x06_ts.idc \
	$(DEVICE_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
	$(DEVICE_PATH)/configs/idc/Synaptics_RMI4_TouchPad_Sensor.idc:system/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
	$(DEVICE_PATH)/configs/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml