#!/bin/bash

# Rebuild DTB and Kernel
source build/envsetup.sh
lunch kvim2-userdebug-64
source device/khadas/kvim2/mkern.sh

# Package Update Image
./vendor/amlogic/tools/aml_upgrade/aml_image_v2_packer  -r out/target/product/kvim2/upgrade/aml_upgrade_package.conf  out/target/product/kvim2/upgrade/ out/target/product/kvim2/update.img
