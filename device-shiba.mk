#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_KERNEL_DIR := device/google/shusky-kernels

ifneq ($(TARGET_BOOTS_16K),true)
PRODUCT_16K_DEVELOPER_OPTION := true
endif

$(call inherit-product, frameworks/native/build/phone-xhdpi-8192-dalvik-heap.mk)

# Inherit from zuma
include device/google/zuma/common.mk

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/permissions_com.android.pixeldisplayservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions_com.android.pixeldisplayservice.xml

# EUICC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/permissions_com.google.android.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/permissions_com.google.android.euicc.xml

# Google Camera
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sysconfig/the_experiences.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/the_experiences.xml

# GPS
PRODUCT_PACKAGES += \
    android.hardware.sensors-V2-ndk.vendor:64

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayVendorShusky \
    PixelNfcOverlayShusky \
    PixelWifiOverlay2023Shusky \
    SafetyRegulatoryInfoOverlayProductShusky

PRODUCT_PACKAGES += \
    DMServiceOverlayVendorShiba \
    FrameworkResOverlayProductShiba \
    FrameworkResOverlayVendorShiba \
    PixelDisplayServiceOverlayProductShiba \
    PixelNfcOverlayShiba \
    SettingsGoogleShibaOverlay \
    SettingsShibaOverlay \
    SystemUIGoogleOverlayVendorShiba

PRODUCT_PACKAGES += \
    ApertureOverlayShiba

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.shiba.rc

PRODUCT_PACKAGES += \
    init.recovery.shiba.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Window extensions
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)
