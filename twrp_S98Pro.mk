#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from S98Pro device
$(call inherit-product, device/doogee/S98Pro/device.mk)

PRODUCT_DEVICE := S98Pro
PRODUCT_NAME := twrp_S98Pro
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := S98Pro
PRODUCT_MANUFACTURER := doogee

PRODUCT_GMS_CLIENTID_BASE := android-doogee

#PRODUCT_BUILD_PROP_OVERRIDES += \
#    PRIVATE_BUILD_DESC="S98Pro-user 12 SP1A.210812.016 1665738746 release-keys"

#BUILD_FINGERPRINT := DOOGEE/S98Pro_EEA/S98Pro:12/SP1A.210812.016/1665735886:user/release-keys
