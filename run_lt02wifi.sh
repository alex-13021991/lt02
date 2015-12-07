#!/bin/sh

cd android_kernel_samsung_lt02
. ~/lt02/build.env
mkdir -p ~/lt02/build/lt02wifi
make O=~/lt02/build/lt02wifi mrproper
make O=~/lt02/build/lt02wifi pxa986_lt02wifi_blackhawk_defconfig
make -j5 O=~/lt02/build/lt02wifi
mkdir -p ~/lt02/build/lt02wifi-bin
mkdir -p ~/lt02/build/lt02wifi-bin/modules
cp ~/lt02/build/lt02wifi/arch/arm/boot/zImage ~/lt02/build/lt02wifi-bin/
find ~/lt02/build/lt02wifi/ -type f -name *.ko -exec cp {} ~/lt02/build/lt02wifi-bin/modules/ \;
cd ~/lt02/android_kernel_samsung_lt02_modules
make clean_modules KERNELDIR=~/lt02/build/lt02wifi KERNEL_OUTDIR=~/lt02/build/lt02wifi-bin
make modules KERNELDIR=~/lt02/build/lt02wifi KERNEL_OUTDIR=~/lt02/build/lt02wifi-bin
cd ~/lt02/
