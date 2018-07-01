$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/coolpad/cp3622a/cp3622a-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/coolpad/cp3622a/overlay

LOCAL_PATH := device/coolpad/cp3622a/prebuilt
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)device/coolpad/cp3622a/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += PinyinIME

PRODUCT_COPY_FILES += \
    device/coolpad/cp3622a/init.rc:root/init.rc \
    device/coolpad/cp3622a/init.qcom.sh:root/init.qcom.sh \
    device/coolpad/cp3622a/init.qcom.rc:root/init.qcom.rc \
    device/coolpad/cp3622a/ueventd.rc:root/ueventd.rc \
    device/coolpad/cp3622a/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/coolpad/cp3622a/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/coolpad/cp3622a/init.qcom.coex.sh:system/etc/init.qcom.post_boot.sh \
    device/coolpad/cp3622a/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/coolpad/cp3622a/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/coolpad/cp3622a/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_KERNEL):kernel

OVERRIDE_PATH := device/coolpad/cp3622a/proprietary/override
PRODUCT_COPY_FILES += \
    $(OVERRIDE_PATH)/lib/liba2dp.so:obj/lib/liba2dp.so \
    $(OVERRIDE_PATH)/lib/libaudio.so:obj/lib/libaudio.so \
    $(OVERRIDE_PATH)/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
    $(OVERRIDE_PATH)/lib/libcamera.so:obj/lib/libcamera.so \
    $(OVERRIDE_PATH)/lib/libcamera_client.so:obj/lib/libcamera_client.so \
    $(OVERRIDE_PATH)/lib/libhardware_legacy.so:obj/lib/libhardware_legacy.so \
    $(OVERRIDE_PATH)/lib/libmedia.so:obj/lib/libmedia.so \
    $(OVERRIDE_PATH)/lib/librpc.so:obj/lib/librpc.so \

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/coolpad/cp3622a/proprietary/override,system) \
    $(call find-copy-subdir-files,*,device/coolpad/cp3622a/proprietary/system,system)

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_cp3622a
PRODUCT_DEVICE := cp3622a

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=off \
ro.debuggable=1 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mass_storage \
ro.bootloader.mode=download \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no

PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish

