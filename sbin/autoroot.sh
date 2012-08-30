#!/sbin/sh

# DooMLoRD: autoroot script (v13)

export PATH=/sbin

# [START] setting up
busybox echo "[START] remounting system" > /data/local/tmp/autorootlog.txt
busybox mount -o remount,rw /system >> /data/local/tmp/autorootlog.txt

# [CHECK] searching if autoroot was done before
busybox echo "[CHECK] searching for autorooted file " >> /data/local/tmp/autorootlog.txt
if [ ! -f /system/autorooted ]; then
busybox	echo "[NOT FOUND] autorooted file not found, removing existing root files ... " >> /data/local/tmp/autorootlog.txt
busybox	rm /system/bin/su
busybox	rm /system/xbin/su
busybox	rm /system/app/Superuser.apk
busybox	rm /data/app/com.noshufou.android.su.apk
busybox	rm /system/xbin/busybox
busybox	rm /system/bin/busybox

busybox	echo "[Superuser app] pushing app ..." >> /data/local/tmp/autorootlog.txt
busybox	cp /res/autoroot/Superuser.apk /system/app/Superuser.apk

busybox	echo "[Superuser app] fixing su perms and owners ..." >> /data/local/tmp/autorootlog.txt
busybox	chown root.root /system/app/Superuser.apk
busybox	chmod 0644 /system/app/Superuser.apk
fi

# [CHECK] verify /system/xbin
busybox echo "[CHECK] verifying /system/xbin " >> /data/local/tmp/autorootlog.txt
busybox mkdir /system/xbin
busybox chmod 755 /system/xbin

# [SU binary] remove existing occurances and push su
if [ ! -f /system/xbin/su ]; then
busybox	echo "[SU binary] pushing su ..." >> /data/local/tmp/autorootlog.txt
busybox	cp /res/autoroot/su /system/xbin/su
fi
echo "[SU binary] fixing su perms and owners ..." >> /data/local/tmp/autorootlog.txt
busybox chown root.root /system/xbin/su
busybox chmod 06755 /system/xbin/su

# [busybox binary] remove existing occurances and push busybox
if [ ! -f /system/xbin/busybox ];
then
busybox	echo "[busybox binary] pushing busybox ..." >> /data/local/tmp/autorootlog.txt
busybox	cp /sbin/busybox /system/xbin/busybox
fi
busybox echo "[busybox] fixing busybox perms and owners ..." >> /data/local/tmp/autorootlog.txt
busybox chown root.root /system/xbin/busybox
busybox chmod 0755 /system/xbin/busybox

# [DONE] placing flag
busybox echo "[DONE] placing flag" >> /data/local/tmp/autorootlog.txt
busybox touch /system/autorooted

# [DONE] all done exiting
busybox echo "[DONE] all done exiting" >> /data/local/tmp/autorootlog.txt 
