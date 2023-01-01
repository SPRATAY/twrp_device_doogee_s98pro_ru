#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/doogee/S98Pro

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
#TARGET_SUPPORTS_64_BIT_APPS := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k81v1_64
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := S98Pro_defconfig
TARGET_KERNEL_SOURCE := kernel/doogee/S98Pro

# Kernel - prebuilt
#TARGET_FORCE_PREBUILT_KERNEL := true
#ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
#TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
#BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
#BOARD_INCLUDE_DTB_IN_BOOTIMG := 
#endif

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#  TARGET_KERNEL_CONFIG := S98Pro_defconfig
#  TARGET_KERNEL_SOURCE := kernel/doogee/S98Pro
#  TARGET_KERNEL_CLANG_COMPILE := true
#endif

# Platform
TARGET_BOARD_PLATFORM := mt6781

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432 #67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := doogee_dynamic_partitions
BOARD_DOOGEE_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
BOARD_DOOGEE_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Recovery
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# System as Root
BOARD_SUPPRESS_SECURE_ERASE := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

#test
#TW_OEM_BUILD := true
#BOARD_RAMDISK_USE_XZ := true
#BOARD_RAMDISK_USE_LZ4 := true
#TW_EXCLUDE_NANO := true
#TW_EXCLUDE_BASH := true
#TW_EXCLUDE_TZDATA := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false #size
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_APEX := true
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
#TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
