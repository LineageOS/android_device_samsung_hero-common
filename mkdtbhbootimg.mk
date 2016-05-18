LOCAL_PATH := $(call my-dir)

# Generate device tree blob (dtb) from dts
TARGET_KERNEL_DTBS: $(KERNEL_OUT) $(KERNEL_CONFIG) $(KERNEL_HEADERS_INSTALL)
	$(MAKE) $(MAKE_FLAGS) -C $(KERNEL_SRC) O=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE) dtbs

MKDTBHBOOTIMG := $(HOST_OUT_EXECUTABLES)/mkdtbhbootimg$(HOST_EXECUTABLE_SUFFIX)

$(INSTALLED_BOOTIMAGE_TARGET): $(MKDTBHBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) TARGET_KERNEL_DTBS
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKDTBHBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt_dir $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/ --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKDTBHBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		TARGET_KERNEL_DTBS
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKDTBHBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt_dir $(OUT)/obj/KERNEL_OBJ/arch/arm/boot/dts/ --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST} 
