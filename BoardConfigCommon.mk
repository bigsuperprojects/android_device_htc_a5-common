# Copyright (C) 2014 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

LOCAL_PATH := device/htc/a5-common

BOARD_VENDOR := htc

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_DTBTOOL_ARGS := --dt-tag "htc,project-id = <"
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 zcache androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-5.3/bin
TARGET_TOOLCHAIN_ROOT := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-5.3/bin
TARGET_KERNEL_SOURCE := kernel/htc/msm8974
TARGET_KERNEL_CONFIG := lineage_a5_defconfig

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
ifneq (eng,$(TARGET_BUILD_VARIANT))
WITH_DEXPREOPT := true
DONT_DEXPREOPT_PREBUILTS := true
endif
endif

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext
#BOARD_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_NEEDS_METADATA_CAMERA_SOURCE := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# FM Radio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Graphics
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Includes
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# RPC
TARGET_NO_RPC := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 285212672
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4429185024
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_DEVICE_DIRS += device/htc/a5-common
TARGET_RECOVERY_DEVICE_MODULES += chargeled
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true

#TWRP config:
DEVICE_RESOLUTION := 720x1280
TW_NO_USB_STORAGE := true
TW_NO_SCREEN_BLANK := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_IGNORE_MT_POSITION_0 := true

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

# Sensors
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Graphics
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true

# RIL
TARGET_RIL_VARIANT := caf
TARGET_NEEDS_GCC_LIBC := true

# SecComp
#BOARD_SECCOMP_POLICY := device/htc/a5-common/seccomp

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/htc/a5-common/sepolicy

# Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += \
    device/htc/a5-common/cmhw \
    hardware/cyanogen/cmhw

#TWRP
TW_THEME := portrait_hdpi

# MultiROM config
TARGET_RECOVERY_IS_MULTIROM := true
MR_DEVICE_VARIANTS := htc_a5ul     # HTC Desire 816 single sim
MR_DEVICE_VARIANTS += htc_a5dwg    # HTC Desire 816 dual sim
DEVICE_RESOLUTION := 720x1280
MR_NO_KEXEC := enabled
MR_DEVICE_HOOKS := device/htc/a5-common/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
#MR_DEVICE_SPECIFIC_VERSION := c ... let the build script deal with this!
MR_DPI := hdpi
MR_DPI_FONT := 340
MR_ENCRYPTION :=
MR_ENCRYPTION_SETUP_SCRIPT := d
MR_FSTAB := device/htc/a5-common/multirom/mrom.fstab
MR_INIT_DEVICES := device/htc/a5-common/multirom/mr_init_devices.c
MR_INPUT_TYPE := type_b
MR_KEXEC_MEM_MIN := 0x03200000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_MROM_FSTAB := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
# SDClang
TARGET_USE_SDCLANG := true

# inherit from the proprietary version
-include vendor/htc/a5-common/BoardConfigVendor.mk
