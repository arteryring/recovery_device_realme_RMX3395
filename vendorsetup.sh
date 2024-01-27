FDEVICE="RMX3395"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	      
        export ALLOW_MISSING_DEPENDENCIES=true
        export OF_USE_LZ4_COMPRESSION=1
        export FOX_EXCLUDE_NANO_EDITOR=1
        export FOX_REMOVE_BASH=1
        export FOX_REPLACE_TOOLBOX_GETPROP=1
        export FOX_AB_DEVICE=1
        export OF_MAINTAINER=Aks-Brar
        export OF_TWRP_COMPATIBILITY_MODE=1
        export FOX_VIRTUAL_AB_DEVICE=1
        export  OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
        export FOX_EXCLUDE_NANO_EDITOR=1
        export FOX_NO_SAMSUNG_SPECIAL=1
        export FOX_REMOVE_AAPT=1
        export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
        export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021
        
        # dynamic/retrofitted
	if [ "$FOX_USE_DYNAMIC_PARTITIONS" = "1" ]; then
		export FOX_VANILLA_BUILD=1
		export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
		export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
        	export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
   		export OF_DISABLE_OTA_MENU=1
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
