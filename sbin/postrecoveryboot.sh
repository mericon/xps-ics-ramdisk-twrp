#!/sbin/sh

export LD_LIBRARY_PATH=:/sbin
echo 32 > /sys/class/leds/button-backlight/brightness
