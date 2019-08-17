# Copyright (C) 2013 The CyanogenMod Project
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

PRODUCT_PLATFORM_SOD := true

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/shinano-common/include

# Platform
BOARD_VENDOR_PLATFORM := shinano
PRODUCT_PLATFORM := shinano

MALLOC_SVELTE := true

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom msm_rtb.filter=0x3b7 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y vmalloc=300M
BOARD_KERNEL_CMDLINE  += skip_initramfs rootwait ro init=/init
BOARD_KERNEL_CMDLINE  += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_AUDIO_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE = true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_DISABLED_FM_VIRTUAL_RECORD := true
AUDIO_FEATURE_ENABLED_AUXPCM_BT := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 0

# FM
BOARD_HAVE_ALTERNATE_FM := true
BOARD_HAVE_BCM_FM := true
BOARD_HAVE_FM_RADIO := true
BOARD_DISABLE_FMRADIO_LIBJNI := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/shinano-common/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/sony/shinano-common/bluetooth/vnd_shinano.txt

# BT/FM (Broadcom): Adjust the sysfs patch for 3.4 kernel
BOARD_HAVE_BCM_FM_SYSFS := "/sys/bus/platform/drivers/bcm_ldisc/bcm_ldisc/"
BOARD_BRCM_HCI_NUM := 26

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Camera
TARGET_USES_MEDIA_EXTENSIONS := true

# GPS
TARGET_PROVIDES_GPS_LOC_API := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_shinano

# Keystore
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/sony/shinano-common/sepolicy

# Props for hotplugging
TARGET_SYSTEM_PROP += device/sony/shinano-common/system.prop

#Sensors
USE_SENSOR_MULTI_HAL := true

# KCAL
SUPPORTS_KCAL_COLORCONTROL := true

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := /dev/pn547
BOARD_NFC_HAL_SUFFIX := qcom
NXP_CHIP_TYPE := 1

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/bin/credmgrd|/vendor/lib/libshims_signal.so \
    /vendor/bin/iddd|/vendor/lib/libshims_idd.so \
    /vendor/bin/suntrold|/vendor/lib/libshims_signal.so \
    /system/lib/hw/camera.vendor.qcom.so|/vendor/lib/libsonycamera.so \
    /system/lib/libcammw.so|libsensor.so \
    /system/lib/libsomc_chokoballpal.so|/vendor/lib/libshim_camera.so

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Filesystem (for Q)
TARGET_FS_CONFIG_GEN += device/sony/shinano-common/config.fs
BOARD_ROOT_EXTRA_FOLDERS := idd lta-label persist tmp

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/shinano-common/rootdir/etc/fstab.full
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
SONY_INIT_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery
