#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#


# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    gz \
    lk \
    md1img \
    pi_img \
    preloader_raw \
    scp \
    spmfw \
    sspm \
    tee \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    pl \
    product \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# V A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Dynam
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# API
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot Control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    bootctrl.mt6781.recovery
#    android.hardware.boot@1.1-impl.recovery \
#    android.hardware.boot@1.1-impl \
#    android.hardware.boot@1.1-service \
#    bootctrl.mt6781.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Fastbootd
PRODUCT_PACKAGES += \
	fastbootd \
	android.hardware.fastboot@1.0-impl-mock

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
