#!/system/bin/sh

UKM=/data/UKM;
BB=$UKM/busybox;
DEVPROP="ro.product.device";
DEVICE=`getprop "$DEVPROP" 2> /dev/null`;

if [ -z "$DEVICE" ]; then DEVICE=`$BB grep "$DEVPROP=" /system/build.prop | $BB cut -d= -f2`; fi;

#Unofficial
case $DEVICE in
	s5|klte|g900f|sm-g900f|kltevzw|klteduos|kltespr|klteusc|kltedv|SM-g900v|SM-G900I|SM-G900T|SM-G900P|SM-G900M|SM-G900W8|g900v|G900I|G900T|G900P|G900M|G900W8|samsung)
		CONFIG="s5";; #SAMSUNG GALAXY S5
	*)
		CONFIG="";; #Not defined
esac;

if [ -n "$CONFIG" ]; then PATH="$UKM/device/$CONFIG.sh"; else PATH=""; fi;

$BB echo "$PATH";
