#!/bin/bash

# Rebuild U-Boot
cd uboot
make CROSS_COMPILE=aarch64-linux-gnu- kvim2_defconfig
make CROSS_COMPILE=aarch64-linux-gnu-

# Copy files to output directory
cd ../
cp uboot/fip/u-boot.bin out/target/product/kvim2/
cp uboot/fip/u-boot.bin.usb.bl2  out/target/product/kvim2/upgrade/
cp uboot/fip/u-boot.bin.usb.tpl  out/target/product/kvim2/upgrade/
cp uboot/fip/u-boot.bin.sd.bin   out/target/product/kvim2/upgrade/

# Package Update Image
./vendor/amlogic/tools/aml_upgrade/aml_image_v2_packer  -r out/target/product/kvim2/upgrade/aml_upgrade_package.conf  out/target/product/kvim2/upgrade/ out/target/product/kvim2/update.img
