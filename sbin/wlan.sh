#!/sbin/sh

# DooMLoRD: autoroot script (v13)

export PATH=/sbin

# [START] setting up
echo "[START] remounting system" > /data/local/tmp/wlanmod.txt
mount -o remount,rw /system >> /data/local/tmp/wlanmod.txt

# [CHECK] searching if autoroot was done before
echo "[CHECK] searching for file " >> /data/local/tmp/wlanmod.txt
if [ ! -f /res/bcm4330.ko.new ]; then
	echo "[NEW MODULE FOUND] wlanmod file not found, removing existing root file ... " >> /data/local/tmp/wlanmod.txt
	rm /system/lib/modules/bcm4330.ko

	echo "[bcm4330.ko] ..." >> /data/local/tmp/wlanmod.txt
	cp /res/bcm4330.ko.new /system/lib/modules/bcm4330.ko

	echo "[fix] ..." >> /data/local/tmp/wlanmod.txt
	chown root.root /system/lib/modules/bcm4330.ko
	chmod 0666 /system/lib/modules/bcm4330.ko
fi

if [ ! -f /sbin/wlanmod ]; then
	echo "[NOT FOUND] wlanmod file not found, removing existing root file ... " >> /data/local/tmp/wlanmod.txt
	rm /system/lib/modules/bcm4330.ko

	echo "[bcm4330.ko] ..." >> /data/local/tmp/wlanmod.txt
	cp /res/bcm4330.ko.new /system/lib/modules/bcm4330.ko

	echo "[fix] ..." >> /data/local/tmp/wlanmod.txt
	chown root.root /system/lib/modules/bcm4330.ko
	chmod 0666 /system/lib/modules/bcm4330.ko
fi
# [DONE] placing flag
echo "[DONE] placing flag" >> /data/local/tmp/wlanmod.txt
mv /res/bcm4330.ko.new /res/bcm4330.ko
touch /system/wlanmod
# [DONE] all done exiting
echo "[DONE] all done exiting" >> /data/local/tmp/wlanmod.txt 
