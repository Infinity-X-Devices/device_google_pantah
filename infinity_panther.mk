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
$(call inherit-product, device/google/pantah/aosp_panther.mk)
$(call inherit-product, device/google/gs201/infinity_common.mk)

include device/google/pantah/panther/device-infinity.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_NAME := infinity_panther

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=panther \
    PRIVATE_BUILD_DESC="panther-user 14 AP2A.240905.003 12231197 release-keys"

BUILD_FINGERPRINT := google/panther/panther:14/AP2A.240905.003/12231197:user/release-keys

$(call inherit-product, vendor/google/panther/panther-vendor.mk)
