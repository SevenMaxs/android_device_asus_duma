#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/asus/duma/duma-vendor.mk)

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Set LineageOS build tipe
CM_BUILDTYPE := NIGHTLY

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920
TARGET_BOOTANIMATION_HALF_RES := true

# Features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Rild
PRODUCT_PACKAGES := \
    rild \
    CarrierConfig \
    BasicSmsReceiver

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so

# Disable EGL buffer_age extension support
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

PRODUCT_COPY_FILES += \
    device/asus/duma/audio/audio_effects_vendor.conf:system/etc/audio_effects_vendor.conf \
    device/asus/duma/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/duma/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Get the long list of APNs
PRODUCT_COPY_FILES += \
    device/asus/duma/configs/apns-conf.xml:system/etc/apns-conf.xml

# Bluetooth
PRODUCT_PACKAGES += \
    bdAddrLoader \
    hci_qcomm_init \
    init.duma.bt.sh

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0
 
# Configure ro.recents.grid
PRODUCT_PROPERTY_OVERRIDES += \
    ro.recents.grid=false

# Preset for Russia
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Moscow \
    persist.sys.language=ru \
    persist.sys.country=RU

#FM Radio
PRODUCT_PACKAGES += \
    libqcomfm_jni \
    qcom.fmradio \
    qcom.fmradio.xml

# FM HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    Camera2 \
    camera.duma
    #camera.msm8960

PRODUCT_PACKAGES += \
    hostapd_default.conf

# Disable camera Treble path
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_treble=true

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger_touch

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl \
    android.hardware.memtrack@1.0-impl \
    libgenlock \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

# GPS
PRODUCT_PACKAGES += \
    gps.conf \
    gps.msm8960

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# RenderScript HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0-impl \
    android.hardware.radio.deprecated@1.0-impl

# Configstore HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml

# IPC router config
PRODUCT_COPY_FILES += \
    device/asus/duma/configs/sec_config:system/etc/sec_config

# Keylayouts
PRODUCT_COPY_FILES += \
    device/asus/duma/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
    device/asus/duma/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/asus/duma/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/asus/duma/keylayout/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
    device/asus/duma/keylayout/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
    device/asus/duma/keylayout/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
    device/asus/duma/keylayout/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
    device/asus/duma/keylayout/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Keystore
#PRODUCT_PACKAGES += \
    keystore.msm8960

# Kickstart
PRODUCT_COPY_FILES += \
    device/asus/duma/kickstart_checker.sh:system/bin/kickstart_checker.sh

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.msm8960

# Media
PRODUCT_COPY_FILES += \
    device/asus/duma/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/duma/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/duma/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Misc
PRODUCT_CHARACTERISTICS := tablet

# OMX
PRODUCT_PACKAGES += \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Permissions/features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.duma

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.duma \
    init.duma.rc \
    init.duma.power.rc \
    init.duma.usb.rc \
    init.recovery.duma.rc \
    ueventd.rc \
    ueventd.duma.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/_hals.conf:system/vendor/etc/sensors/_hals.conf

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    sensors.msm8960

# Thermal
PRODUCT_COPY_FILES += \
    device/asus/duma/configs/thermald-duma.conf:system/etc/thermald.conf

PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl
 
PRODUCT_PACKAGES += \
    android.hardware.health@1.0-impl

# Touchscreen calibration
PRODUCT_COPY_FILES += \
    device/asus/duma/configs/touch_dev.idc:system/usr/idc/touch_dev.idc \
    device/asus/duma/configs/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    conn_init \
    dhcpcd.conf \
    wificond \
    hostapd \
    libwfcu \
    p2p_supplicant_overlay.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    init.duma.wifi.sh

PRODUCT_COPY_FILES += \
    device/asus/duma/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/asus/duma/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/asus/duma/wifi/WCNSS_qcom_wlan_nv_duma.bin:system/etc/wifi/WCNSS_qcom_wlan_nv_deb.bin

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors
