LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src

LOCAL_SRC_FILES := \
	jni/com_android_inputmethod_latin_BinaryDictionary.cpp \
	src/dictionary.cpp \
	src/char_utils.cpp

#FLAG_DBG := true

ifneq ($(FLAG_DBG), true)
    LOCAL_NDK_VERSION := 4
endif

LOCAL_SDK_VERSION := 8

LOCAL_MODULE := libjni_latinime

LOCAL_MODULE_TAGS := user

ifeq ($(FLAG_DBG), true)
    $(warning "Making debug build.")
    LOCAL_CFLAGS += -DFLAG_DBG
    LOCAL_SHARED_LIBRARIES := libcutils libutils
endif

include $(BUILD_SHARED_LIBRARY)
