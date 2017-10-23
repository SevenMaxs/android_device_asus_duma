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

ifneq ($(filter duma,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := hostapd_default.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/hostapd
include $(BUILD_PREBUILT)

# Create links for audcal data files
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wcd9310; \
	ln -sf /data/misc/audio/wcd9310_anc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9310/wcd9310_anc.bin;\
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9310/wcd9310_mbhc.bin)

# Create links for firmware files
$(shell ln -sf /system/vendor/firmware/a300_pfp.fw \
		$(TARGET_OUT)/etc/firmware/a300_pfp.fw;\
	ln -sf /system/vendor/firmware/a300_pm4.fw \
		$(TARGET_OUT)/etc/firmware/a300_pm4.fw;\
	ln -sf /system/vendor/firmware/leia_pfp_470.fw \
		$(TARGET_OUT)/etc/firmware/leia_pfp_470.fw;\
	ln -sf /system/vendor/firmware/leia_pm4_470.fw \
		$(TARGET_OUT)/etc/firmware/leia_pm4_470.fw)

# Create links for tzapps files
$(shell ln -sf /system/vendor/firmware/tzapps.b00 \
		$(TARGET_OUT)/etc/firmware/tzapps.b00;\
	ln -sf /system/vendor/firmware/tzapps.b01 \
		$(TARGET_OUT)/etc/firmware/tzapps.b01;\
	ln -sf /system/vendor/firmware/tzapps.b02 \
		$(TARGET_OUT)/etc/firmware/tzapps.b02;\
	ln -sf /system/vendor/firmware/tzapps.b03 \
		$(TARGET_OUT)/etc/firmware/tzapps.b03;\
	ln -sf /system/vendor/firmware/tzapps.mdt \
		$(TARGET_OUT)/etc/firmware/tzapps.mdt)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
