LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS 	:= eng
LOCAL_MODULE 		:= twrp.fstab
LOCAL_MODULE_CLASS 	:= ETC
LOCAL_SRC_FILES         := root/etc/twrp.fstab
LOCAL_MODULE_PATH       := $(TARGET_RECOVERY_ROOT_OUT)/etc

LOCAL_POST_INSTALL_CMD += \
    cp -uv $(TARGET_ROOT_OUT)/init.real $(TARGET_RECOVERY_ROOT_OUT)/init ;

LOCAL_ADDITIONAL_DEPENDENCIES += \
    $(TARGET_ROOT_OUT)/init \
    $(TARGET_ROOT_OUT)/init.real \
    init_sony
#    twrpdec \

# if hw keystore, build keystore support and create /system symlinks
#ifeq ($(TARGET_HW_KEYSTORE), true)
##we have hw keystore, add to build
#LOCAL_ADDITIONAL_DEPENDENCIES += \
#    libvolddecrypt \
#    init.recovery.vold_decrypt.rc
#
#endif
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_PREBUILT)

#workaround for cp blobs when make recoveryimage
recovery-full: twrp.fstab recoveryimage
	echo "done!"
