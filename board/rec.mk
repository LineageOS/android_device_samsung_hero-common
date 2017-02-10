# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/15400000.usb/15400000.dwc3/gadget/lun%d/file"

# TWRP specific
ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/samsung/hero-common/ramdisk/recovery.fstab
TW_BRIGHTNESS_PATH := "/sys/devices/13900000.dsim/backlight/panel/brightness"
TW_DEFAULT_BRIGHTNESS := 180
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_MAX_BRIGHTNESS := 255
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
else
TARGET_RECOVERY_FSTAB := device/samsung/hero-common/ramdisk/fstab.samsungexynos8890
endif
