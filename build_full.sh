#!/bin/bash

# build uboot
cd uboot
make CROSS_COMPILE=aarch64-linux-gnu- kvim2_defconfig
make CROSS_COMPILE=aarch64-linux-gnu-

# build android
cd ../
source build/envsetup.sh
lunch kvim2-userdebug-64
make -j8 otapackage
