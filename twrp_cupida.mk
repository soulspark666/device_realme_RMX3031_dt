#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from cupida device
$(call inherit-product-if-exists, device/oplus/cupida/device.mk)

# Inherit some common twrp stuff.
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := twrp_cupida
PRODUCT_DEVICE := cupida
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme X7 Max 5G
PRODUCT_MANUFACTURER := oplus

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0
