# Release name
PRODUCT_RELEASE_NAME := hero2ltexx

# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/hero2ltexx/device_hero2ltexx.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_hero2ltexx
PRODUCT_DEVICE := hero2ltexx
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G935F
PRODUCT_MANUFACTURER := samsung
