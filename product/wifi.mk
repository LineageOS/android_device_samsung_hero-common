DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Init Resources
PRODUCT_PACKAGES += \
	init.wifi.rc

# Packages
PRODUCT_PACKAGES += \
	macloader \
	wifiloader \
	hostapd \
	libwpa_client \
	wpa_supplicant \
	wpa_supplicant.conf

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0
