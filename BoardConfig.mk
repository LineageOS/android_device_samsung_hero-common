
LOCAL_PATH := device/samsung/hero2ltexx
# Include path
TARGET_SPECIFIC_HEADER_PATH := device/samsung/hero2ltexx/include

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos8890

TARGET_BUILD_VARIANT := eng

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=armeabi
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ENABLE_CPUSETS := true

WITH_DEXPREOPT := true

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a57

# Binder
TARGET_USES_64_BIT_BINDER := true

# no hardware camera
USE_CAMERA_STUB := true
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true

# Bootloader
TARGET_OTA_ASSERT_DEVICE := hero2lte,hero2ltexx
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/hero2ltexx/mkdtbhbootimg.mk
#BOARD_CUSTOM_MKBOOTIMG := mkdtbhbootimg
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --tags_offset 0x10000100
#BOARD_MKBOOTIMG_ARGS += --dt_dir $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x10008000 --ramdisk_offset 0x11000000 --tags_offset 0x10000100 --dt device/samsung/$(TARGET_DEVICE)/dt.img
TARGET_KERNEL_SOURCE := kernel/samsung/exynos8890
TARGET_KERNEL_CONFIG := exynos8890-hero2lte_defconfig
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 48234496
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4508876800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27044851712
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

##TWRP
#Uncomment this to build TWRP
#~ RECOVERY_VARIANT := twrp
#~ TW_NO_REBOOT_BOOTLOADER := true
#~ TW_HAS_DOWNLOAD_MODE := true
#~ TW_THEME := portrait_hdpi
#~ TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
#~ TW_MAX_BRIGHTNESS := 255

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "ARGB_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/samsung/hero2ltexx/rootdir/etc/recovery.fstab
else
TARGET_RECOVERY_FSTAB := device/samsung/hero2ltexx/rootdir/etc/fstab.samsungexynos8890
endif

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/samsung/hero2ltexx/sepolicy

# Radio
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# NFC
BOARD_NFC_HAL_SUFFIX := universal8890

# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5
ENABLE_WEBGL := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := true
BOARD_USE_QOS_CTRL := false
BOARD_USE_VP8ENC_SUPPORT := true

# (G)SCALER
BOARD_USES_SCALER := true
BOARD_USES_DT := true

#~ BOARD_USES_HWC_SERVICES := true
#~ BOARD_USES_GSC_VIDEO := true

#Fix for gralloc & pixelformat
BOARD_USE_BGRA_8888 := true
BOARD_NEEDS_MEMORYHEAPION := true
EXYNOS5_ENHANCEMENTS := true

ifdef EXYNOS5_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DEXYNOS5_ENHANCEMENTS
endif

# Samsung LSI OpenMAX
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# HDMI
BOARD_HDMI_INCAPABLE := true
BOARD_USES_GSC_VIDEO := true

#HeartRate
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Charger
BOARD_BATTERY_DEVICE_NAME := battery
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

### FONTS
EXTENDED_FONT_FOOTPRINT := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin_c0"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin_c0"
WIFI_BAND                        := 802_11_ABG

# CMHW
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# inherit from the proprietary version
-include vendor/samsung/hero2ltexx/BoardConfigVendor.mk

