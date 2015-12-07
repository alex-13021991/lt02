#!/sbin/busybox sh

/sbin/busybox sh /sbin/boot/busybox.sh
/sbin/busybox sh /sbin/boot/install.sh
#/sbin/busybox sh /sbin/boot/tweaks.sh
/sbin/busybox sh /sbin/boot/zram.sh
#/sbin/busybox sh /sbin/boot/scripts.sh

/sbin/busybox mount -o remount,rw /
/sbin/busybox rm -f /res/misc/*
/sbin/busybox mount -o remount,ro /

read sync < /data/sync_fifo
rm /data/sync_fifo

setprop blackhawk.ready 1
