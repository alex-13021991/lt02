#!/bin/sh

cd /home/dell/lt02/android_kernel_samsung_lt02
. /home/dell/lt02/build.env
mkdir -p /home/dell/lt02/build/lt02wifi
make O=/home/dell/lt02/build/lt02wifi mrproper
make O=/home/dell/lt02/build/lt02wifi pxa986_lt02wifi_blackhawk_defconfig
make -j5 O=/home/dell/lt02/build/lt02wifi
mkdir -p /home/dell/lt02/build/lt02wifi-bin
mkdir -p /home/dell/lt02/build/lt02wifi-bin/modules
cp /home/dell/lt02/build/lt02wifi/arch/arm/boot/zImage /home/dell/lt02/build/lt02wifi-bin/
find /home/dell/lt02/build/lt02wifi/ -type f -name *.ko -exec cp {} /home/dell/lt02/build/lt02wifi-bin/modules/ \;
cd /home/dell/lt02/android_kernel_samsung_lt02_modules
make clean_modules KERNELDIR=/home/dell/lt02/build/lt02wifi KERNEL_OUTDIR=/home/dell/lt02/build/lt02wifi-bin
make modules KERNELDIR=/home/dell/lt02/build/lt02wifi KERNEL_OUTDIR=/home/dell/lt02/build/lt02wifi-bin
