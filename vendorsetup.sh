#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2023 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
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
	export FOX_REMOVE_AAPT=1
	export FOX_REMOVE_BUSYBOX_BINARY=1
	export FOX_USE_GREP_BINARY=0
	export FOX_USE_XZ_UTILS=0
	export FOX_USE_SED_BINARY=0
	export FOX_USE_TAR_BINARY=0
	export OF_FLASHLIGHT_ENABLE=1
	export OF_NO_SAMSUNG_SPECIAL=1
	export FOX_DRASTIC_SIZE_REDUCTION=1
	export FOX_REMOVE_BASH=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_FL_PATH1="/sys/class/leds/mt-flash-led1"
	export OF_FL_PATH1="/sys/class/leds/mt-flash-led2"
	export FOX_EXCLUDE_NANO_EDITOR=1
	export FOX_REMOVE_ZIP_BINARY=1
	export OF_MAINTAINER="AKS BRAR"
	export FOX_EXTREME_SIZE_REDUCTION=1
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
