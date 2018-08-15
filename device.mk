#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# call the proprietary setup
$(call inherit-product-if-exists, vendor/nubia/nx549j/nx549j-vendor.mk)

# Audio
PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    com.android.nfc_extras \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm-20797b00.conf:system/etc/libnfc-brcm-20797b00.conf \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/.tp/.thermal-mode-00-01.conf:/system/etc/.tp/.thermal-mode-00-01.conf \
    $(LOCAL_PATH)/configs/thermal/.tp/.thermal-mode-00-02.conf:/system/etc/.tp/.thermal-mode-00-02.conf \
    $(LOCAL_PATH)/configs/thermal/.tp/.thermal-mode-01-01.conf:/system/etc/.tp/.thermal-mode-01-01.conf \
    $(LOCAL_PATH)/configs/thermal/.tp/.thermal-mode-01-02.conf:/system/etc/.tp/.thermal-mode-01-02.conf \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:/system/etc/thermal-engine.conf

# Inherit from msm8953-common
$(call inherit-product, device/nubia/msm8953-common/msm8953.mk)
