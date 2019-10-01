# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Custom Platform Version and Security Patch
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2025-12-05

# Do not build recovery.img from boot.img
BOARD_USES_FULL_RECOVERY_IMAGE := true

# TWRP UI
TW_NO_SCREEN_BLANK := true
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_NEW_ION_HEAP := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
#TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP Storage
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FUSE_EXFAT := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_USB_STORAGE := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_NO_SEPARATE_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true

# TWRP Crypto
TW_INCLUDE_CRYPTO := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_DEVICE_MODULES := chargeled tzdata sbin_timekeep
TARGET_RECOVERY_DEVICE_DIRS := device/sony/shinano-common/twrp
TARGET_RECOVERY_FSTAB := device/sony/shinano-common/twrp/recovery/root/etc/twrp.fstab
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/usr/share/zoneinfo/tzdata

# Ensure gzip compression for recovery
LZMA_RAMDISK_TARGETS := recovery
SONY_INIT_USE_LZMA := true

# Use busybox
TW_USE_TOOLBOX := false
#TW_USE_TOYBOX := true

# Extra languages
TW_EXTRA_LANGUAGES := true

# Logcat for debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#MultiROM config. MultiROM also uses parts of TWRP config
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/sony/shinano-common/multirom/mr_init_devices.c
MR_DEVICE_HOOKS := device/sony/shinano-common/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/sony/shinano-common/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_KEXEC_DTB := true
MR_NO_KEXEC := enabled
MR_FSTAB := device/sony/shinano-common/multirom/twrp.fstab
MR_USE_MROM_FSTAB := true
MR_PIXEL_FORMAT := "RGBX_8888"

# For KEXEC
#MR_KEXEC_MEM_MIN := 0x3e7e0000
MR_KEXEC_MEM_MIN := 0x0ff00000

# Versioning
#BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
#MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
#MR_DEVICE_SPECIFIC_VERSION := c
