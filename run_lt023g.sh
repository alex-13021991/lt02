#!/bin/sh

cd android_kernel_samsung_lt02
. ~/lt02/build.env
mkdir -p ~/lt02/build/lt023g
make O=~/lt02/build/lt023g mrproper
make O=~/lt02/build/lt023g pxa986_lt023g_blackhawk_defconfig
make -j5 O=~/lt02/build/lt023g
mkdir -p ~/lt02/build/lt023g-bin
mkdir -p ~/lt02/build/lt023g-bin/modules
cp ~/lt02/build/lt023g/arch/arm/boot/zImage ~/lt02/build/lt023g-bin/
find ~/lt02/build/lt023g/ -type f -name *.ko -exec cp {} ~/lt02/build/lt023g-bin/modules/ \;
cd ~/lt02/android_kernel_samsung_lt02_modules
make clean_modules KERNELDIR=~/lt02/build/lt023g KERNEL_OUTDIR=~/lt02/build/lt023g-bin
make modules KERNELDIR=~/lt02/build/lt023g KERNEL_OUTDIR=~/lt02/build/lt023g-bin
cd ~/lt02/
