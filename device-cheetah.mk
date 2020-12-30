#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := pantah
TARGET_KERNEL_PATH := device/google/pantah-kernels
TARGET_KERNEL_DIR := $(TARGET_KERNEL_PATH)/6.1
TARGET_BOARD_KERNEL_HEADERS := $(TARGET_KERNEL_DIR)/kernel-headers
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

LOCAL_PATH := device/google/pantah

# Inherit from gs201
include device/google/gs201/common.mk

# Always use scudo for memory allocator
PRODUCT_USE_SCUDO := true

# Camera
$(call inherit-product-if-exists, vendor/google/camera/config.mk)

# Face unlock
$(call inherit-product-if-exists, vendor/google/faceunlock/config.mk)

# PixelParts
include packages/apps/PixelParts/device.mk

# Pixel APN list
$(call inherit-product, vendor/google/CarrierSettings/telephony.mk)

# ViPER4Android FX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# EUICC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/permissions_com.google.android.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/permissions_com.google.android.euicc.xml

# Google Camera
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/the_experiences.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/the_experiences.xml

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayProductPantah \
    FrameworkResOverlayVendorPantah \
    ONSOverlayVendorPantah \
    PixelNfcOverlayPantah \
    SafetyRegulatoryInfoOverlayProductPantah \
    SystemUIGoogleOverlayVendorPantah

PRODUCT_PACKAGES += \
    DMServiceOverlayProductGs201 \
    DMServiceOverlayVendorCheetah \
    FrameworkResOverlayVendorCheetah \
    PixelNfcOverlayCheetah \
    PixelWifiOverlay2023_midyear_F10 \
    SettingsGoogleCheetahOverlay \
    SettingsGoogleOverlayProductCheetah \
    SettingsOverlayGE2AE \
    SettingsOverlayGFE4J \
    SettingsOverlayGP4BC \
    SystemUIGoogleOverlayVendorCheetah

PRODUCT_PACKAGES += \
    ApertureOverlayCheetah

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.cheetah.rc

PRODUCT_PACKAGES += \
    init.recovery.cheetah.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
