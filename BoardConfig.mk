LOCAL_PATH := device/samsung/hero2ltexx

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos8890

# Architecture
TARGET_BUILD_VARIANT := userdebug
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# no hardware camera
USE_CAMERA_STUB := true



# Bootloader
TARGET_OTA_ASSERT_DEVICE := hero2lte,hero2ltexx
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel

BOARD_CUSTOM_BOOTIMG_MK := device/samsung/hero2ltexx/mkdtbhbootimg.mk
BOARD_CUSTOM_MKBOOTIMG := mkdtbhbootimg
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --tags_offset 0x10000100
BOARD_MKBOOTIMG_ARGS += --dt_dir $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/
TARGET_KERNEL_SOURCE := kernel/samsung/exynos8890
TARGET_KERNEL_CONFIG := exynos8890-hero2lte_defconfig
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/samsung/hero2ltexx/include

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 83886080
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 96468992
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 9017753600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54089744384
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072


##TWRP
#Uncomment this to build TWRP
#RECOVERY_VARIANT := twrp
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
TW_MAX_BRIGHTNESS := 255

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/k3gxx/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/samsung/hero2ltexx/rootdir/etc/recovery.fstab
else
TARGET_RECOVERY_FSTAB := device/samsung/hero2ltexx/rootdir/etc/fstab.universal8890
endif

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/samsung/k3gxx/sepolicy

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/hero2ltexx/configs/egl/egl.cfg
DEFAULT_FB_NUM := 0
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
ENABLE_WEBGL := true
# Samsung LSI OpenMAX
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# Disable HDMI for now
BOARD_HDMI_INCAPABLE := true

#HeartRate
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# frameworks/native/libs/binder/Parcel.cpp
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

### FONTS
EXTENDED_FONT_FOOTPRINT := true

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
#BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

# Scaler
BOARD_USES_SCALER := true

# WFD
#BOARD_USES_WFD_SERVICE := true
BOARD_USES_WFD := true

# CMHW
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# inherit from the proprietary version
-include vendor/samsung/hero2ltexx/BoardConfigVendor.mk
