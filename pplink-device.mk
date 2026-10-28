# PPLINK 7981 —— 追加到 target/linux/mediatek/image/filogic.mk 末尾
#
# 布局与原厂一致：UBI 里 kernel(vol0) / rootfs(vol1) / rootfs_data(vol2)
# 所以用 KERNEL_IN_UBI + sysupgrade-tar（产出 tar 内含 kernel 与 root 两个成员，
# 与原厂升级脚本 nand_upgrade_tar 的读取方式完全对得上）。
#
# 参考官方同类设备：h3c_magic-nx30-pro-nmbm（NMBM + stock 双卷布局）

define Device/pplink_7981
  DEVICE_VENDOR := PPLINK
  DEVICE_MODEL := 7981
  DEVICE_DTS := mt7981b-pplink-7981
  DEVICE_DTS_DIR := ../dts
  DEVICE_PACKAGES := kmod-mt7915e kmod-mt7981-firmware mt7981-wo-firmware
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  KERNEL_IN_UBI := 1
  IMAGES := sysupgrade.bin
  # lzma 压缩，控制 kernel 卷体积（原厂 kernel 卷本身只有 ~3.4MiB 起步）
  KERNEL := kernel-bin | lzma | fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS := kernel-bin | lzma | \
	fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb with-initrd | pad-to 64k
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += pplink_7981
