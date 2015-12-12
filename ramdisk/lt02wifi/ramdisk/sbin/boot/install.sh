if /sbin/busybox [ ! -f /system/blackhawk/release-21- ]; then
  # Remount system RW
  /sbin/busybox mount -o remount,rw /system

  # Ensure /system/xbin exists
  /sbin/busybox mkdir -p /system/xbin
  /sbin/busybox chmod 755 /system/xbin

  # Ensure /system/etc/init.d exists
  /sbin/busybox mkdir -p /system/etc/init.d
  /sbin/busybox chmod 755 /system/etc/init.d

  # su
  /sbin/busybox rm -f /system/bin/su
  /sbin/busybox cp -f /res/misc/su /system/xbin/su
  /sbin/busybox chown 0.0 /system/xbin/su
  /sbin/busybox chmod 6755 /system/xbin/su

  # Superuser
  /sbin/busybox rm -f /system/app/SuperUser.apk
  /sbin/busybox rm -rf /data/data/com.noshufou.android.su
  /sbin/busybox rm -f /data/dalvik-cache/*com.noshufou.android.su-*.apk*
  /sbin/busybox rm -f /data/dalvik-cache/*SuperUser.apk*
  if [ ! -e /system/app/Superuser.apk ]; then
    /sbin/busybox rm -rf /data/data/eu.chainfire.supersu
    /sbin/busybox rm -f /data/dalvik-cache/*eu.chainfire.supersu-*.apk*
    /sbin/busybox rm -f /data/dalvik-cache/*Superuser.apk*
  fi
  /sbin/busybox rm -f /data/app/Superuser.apk
  /sbin/busybox cp -f /res/misc/Superuser.apk /system/app/Superuser.apk
  /sbin/busybox chown 0.0 /system/app/Superuser.apk
  /sbin/busybox chmod 644 /system/app/Superuser.apk

  # Clean init.d
  cd /system/etc/init.d/
  for f in $(/sbin/busybox ls -a | /sbin/busybox grep -v ^90userinit$); do
    /sbin/busybox rm -f $f
  done
  cd /

  # Extended kernel modules
  /sbin/busybox cp -f /res/misc/02modules /system/etc/init.d/02modules
  /sbin/busybox chown 0.0 /system/etc/init.d/02modules
  /sbin/busybox chmod 755 /system/etc/init.d/02modules

  # CM userinit
  /sbin/busybox cp -f /res/misc/90userinit /system/etc/init.d/90userinit
  /sbin/busybox chown 0.0 /system/etc/init.d/90userinit
  /sbin/busybox chmod 755 /system/etc/init.d/90userinit
  
  # Post boot script
  /sbin/busybox cp -f /res/misc/post_boot.sh /system/etc/init.post_boot.sh
  /sbin/busybox chown 0.0 /system/etc/init.post_boot.sh
  /sbin/busybox chmod 750 /system/etc/init.post_boot.sh

  # Force GPU rendering, user can change it anytime
  /sbin/busybox echo -n true > /data/property/persist.sys.ui.hw
  /sbin/busybox chmod 600 /data/property/persist.sys.ui.hw

  # Add compcache
  #/sbin/busybox cp -f /res/misc/compcache /system/bin/compcache
  #/sbin/busybox chmod 755 /system/bin/compcache

  # Once be enough
  /sbin/busybox mkdir -p /system/blackhawk
  /sbin/busybox chmod 755 /system/blackhawk
  /sbin/busybox rm /system/blackhawk/*
  echo 1 > /system/blackhawk/release-21-

  # Remount system RO
  /sbin/busybox mount -o remount,ro /system
fi;
