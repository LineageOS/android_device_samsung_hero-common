#
# Copyright (C) 2017 Fernando Von Arx <fer.vonarx@gmail.com>
# Copyright (C) 2017 Jesse Chan <cjx123@outlook.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

# Dalvik/Art
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.fw.dex2oat_thread_count=4 \
	dalvik.vm.heapstartsize=8m \
	dalvik.vm.heapgrowthlimit=256m \
	dalvik.vm.heapsize=512m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=2m \
	dalvik.vm.heapmaxfree=8m

# Hwui
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=88 \
	ro.hwui.layer_cache_size=58 \
	ro.hwui.path_cache_size=16 \
	ro.hwui.texture_cache_flushrate=0.4 \
	ro.hwui.shape_cache_size=4 \
	ro.hwui.gradient_cache_size=2 \
	ro.hwui.drop_shadow_cache_size=6 \
	ro.hwui.r_buffer_cache_size=8 \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.text_small_cache_height=1024 \
	ro.hwui.text_large_cache_width=4096 \
	ro.hwui.text_large_cache_height=2048 \
	ro.hwui.fbo_cache_size=16

# Network
# Define default initial receive window size in segments.
PRODUCT_PROPERTY_OVERRIDES += \
	net.tcp.default_init_rwnd=60