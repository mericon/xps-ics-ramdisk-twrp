#!/sbin/sh

# DooMLoRD: autoroot script (v13)

export PATH=/sbin

# [START] setting up
echo "[START] remounting system" > /data/local/tmp/tweaks.txt
mount -o remount,rw /system >> /data/local/tmp/tweaks.txt

# [CHECK] searching if autoroot was done before
echo "[CHECK] searching for file " >> /data/local/tmp/tweaks.txt
if [ ! -f /system/tweaked ]; then
	echo "[NOT FOUND] autorooted file not found, removing existing root file ... " >> /data/local/tmp/autorootlog.txt
	rm /system/etc/init.d/99mtweaks

	echo "[Tweak] ..." >> /data/local/tmp/tweaks.txt
	cp /res/99mtweaks /system/etc/init.d/99mtweaks

	echo "[fix] ..." >> /data/local/tmp/tweaks.txt
	chown root.root /system/etc/init.d/99mtweaks
	chmod 0644 /system/etc/init.d/99mtweaks
fi

# [DONE] placing flag
echo "[DONE] placing flag" >> /data/local/tmp/tweaks.txt
touch /system/tweaked
# [DONE] all done exiting
echo "[DONE] all done exiting" >> /data/local/tmp/tweaks.txt 
