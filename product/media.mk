DEVICE_PATH := device/samsung/hero-common

# Configs
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE_PATH)/configs/media/somxreg.conf:system/etc/somxreg.conf

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	media.sf.omx-plugin=libffmpeg_omx.so,libsomxcore.so
