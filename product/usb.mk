# Init Resources
PRODUCT_PACKAGES += \
	init.samsungexynos8890.usb.rc

# Packages
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.hardware=universal8890 \
	ro.securestorage.support=false
