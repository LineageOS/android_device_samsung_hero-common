# Packages
PRODUCT_PACKAGES += \
	libion_exynos \
	libfimg
#	libion
#	gralloc.exynos5

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bq.gpu_to_cpu_unsupported=1 \
	ro.opengles.version=196609 \
	ro.sf.lcd_density=560 \
	debug.hwc.force_gpu=1 \
	ro.bq.gpu_to_cpu_unsupported=1 \
	ro.opengles.version=196609 \
	ro.sf.lcd_density=560

# Properties - HWC - not used on cm/aosp
PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwc.winupdate=1 \
	debug.hwc.otf=1
