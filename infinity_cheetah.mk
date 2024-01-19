#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Infinity-X stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Infinity-X Flags
WITH_GMS := true
INFINITY_BUILD_TYPE := OFFICIAL
INFINITY_MAINTAINER := Pyrtle93
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_IS_PIXEL := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_EXCLUDES_VIA := true

# Inherit device configuration
$(call inherit-product, device/google/pantah/aosp_cheetah.mk)
$(call inherit-product, device/google/gs201/infinity_common.mk)

include device/google/pantah/cheetah/device-infinity.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7 Pro
PRODUCT_NAME := infinity_cheetah

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=cheetah \
    PRIVATE_BUILD_DESC="cheetah-user 14 AP2A.240905.003 12231197 release-keys"

BUILD_FINGERPRINT := google/cheetah/cheetah:14/AP2A.240905.003/12231197:user/release-keys

$(call inherit-product, vendor/google/cheetah/cheetah-vendor.mk)
