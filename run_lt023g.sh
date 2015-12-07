#!/bin/sh

cd /home/dell/lt02/android_kernel_samsung_lt02
. /home/dell/lt02/build.env
mkdir -p /home/dell/lt02/build/lt023g
make O=/home/dell/lt02/build/lt023g mrproper
make O=/home/dell/lt02/build/lt023g pxa986_lt023g_blackhawk_defconfig
make -j5 O=/home/dell/lt02/build/lt023g
mkdir -p /home/dell/lt02/build/lt023g-bin
mkdir -p /home/dell/lt02/build/lt023g-bin/modules
cp /home/dell/lt02/build/lt023g/arch/arm/boot/zImage /home/dell/lt02/build/lt023g-bin/
find /home/dell/lt02/build/lt023g/ -type f -name *.ko -exec cp {} /home/dell/lt02/build/lt023g-bin/modules/ \;
cd /home/dell/lt02/android_kernel_samsung_lt02_modules
make clean_modules KERNELDIR=/home/dell/lt02/build/lt023g KERNEL_OUTDIR=/home/dell/lt02/build/lt023g-bin
make modules KERNELDIR=/home/dell/lt02/build/lt023g KERNEL_OUTDIR=/home/dell/lt02/build/lt023g-bin
