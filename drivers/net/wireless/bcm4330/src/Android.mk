#
# Copyright (C) 2008 Broadcom Corporation
#
# $Id: Android.mk,v 2.6 2009-05-07 18:25:15 Exp $
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

ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	dhd/exe/dhdu.c \
	dhd/exe/dhdu_linux.c \
	shared/bcmutils.c \
	shared/miniopt.c

LOCAL_MODULE := dhdarm_android
LOCAL_CFLAGS := -DSDTEST -DTARGETENV_android -Dlinux -DLINUX
LOCAL_C_INCLUDES +=$(LOCAL_PATH)/include $(LOCAL_PATH)/../../../../kernel/include
LOCAL_FORCE_STATIC_EXECUTABLE := true

LOCAL_STATIC_LIBRARIES := libc

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := debug tests

include $(BUILD_EXECUTABLE)

endif  # TARGET_SIMULATOR != true
