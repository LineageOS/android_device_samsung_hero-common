#
# Copyright (C) 2017 Fernando Von Arx <fer.vonarx@gmail.com>
# Copyright (C) 2017 Jesse Chan <cjx123@outlook.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

LOCAL_PATH := device/samsung/hero-common

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos8890
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Audio HAL variant
TARGET_AUDIOHAL_VARIANT := samsung

# Binder
TARGET_USES_64_BIT_BINDER := true

# CPUsets
ENABLE_CPUSETS := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Image
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/hero-common/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL := dtbToolExynos

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec
TARGET_UNIFIED_DEVICE := true

# Packaging
BLOCK_BASED_OTA := false

# Pre-Optimize DEX
WITH_DEXPREOPT := true

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53.a57
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := exynos-m1

# SELinux
BOARD_SEPOLICY_DIRS := device/samsung/hero-common/sepolicy

# Inherit board specific defines
-include device/samsung/hero-common/board/*.mk

# Inherit from the proprietary version
-include vendor/samsung/hero-common/BoardConfigVendor.mk
