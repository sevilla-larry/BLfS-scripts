# b.24.00.Part3.09-17.2.PC.sh
#
# Graphical Environments
#
#   24.09
#   to
#   24.17
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.09.libxcvt-0.1.2"
echo "24.09.libxcvt-0.1.2" >> $LFSLOG_PROCESS

time { bash b.24.09.libxcvt-0.1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.10.xcb-util-0.4.1"
echo "24.10.xcb-util-0.4.1" >> $LFSLOG_PROCESS

time { bash b.24.10.xcb-util-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.11.xcb-util-image-0.4.1"
echo "24.11.xcb-util-image-0.4.1" >> $LFSLOG_PROCESS

time { bash b.24.11.xcb-util-image-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.12.xcb-util-keysyms-0.4.1"
echo "24.12.xcb-util-keysyms-0.4.1" >> $LFSLOG_PROCESS

time { bash b.24.12.xcb-util-keysyms-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.13.xcb-util-renderutil-0.3.10"
echo "24.13.xcb-util-renderutil-0.3.10" >> $LFSLOG_PROCESS

time { bash b.24.13.xcb-util-renderutil-0.3.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.14.xcb-util-wm-0.4.2"
echo "24.14.xcb-util-wm-0.4.2" >> $LFSLOG_PROCESS

time { bash b.24.14.xcb-util-wm-0.4.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.15.xcb-util-cursor-0.1.4"
echo "24.15.xcb-util-cursor-0.1.4" >> $LFSLOG_PROCESS

time { bash b.24.15.xcb-util-cursor-0.1.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#     Libdrm is required by Mesa & libva
###

echo "25.38.Libdrm-2.4.115"
echo "25.38.Libdrm-2.4.115" >> $LFSLOG_PROCESS

time { bash b.25.38.Libdrm-2.4.115.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "44.45.libva-2.19.0"
echo "44.45.libva-2.19.0" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash b.44.45.libva-2.19.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "44.46.libvdpau-1.5"
echo "44.46.libvdpau-1.5" >> $LFSLOG_PROCESS

time { bash b.44.46.libvdpau-1.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.16.Mesa-23.1.6"
echo "24.16.Mesa-23.1.6" >> $LFSLOG_PROCESS

time { bash b.24.16.Mesa-23.1.6-2.PC.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "44.45.libva-2.19.0"
echo "44.45.libva-2.19.0" >> $LFSLOG_PROCESS

export PKGPASS=2
time { bash b.44.45.libva-2.19.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "44.47.libvdpau-va-gl-0.4.0h"
echo "44.47.libvdpau-va-gl-0.4.0" >> $LFSLOG_PROCESS

time { bash b.44.47.libvdpau-va-gl-0.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "44.24.intel-vaapi-driver-2.4.1"
echo "44.24.intel-vaapi-driver-2.4.1" >> $LFSLOG_PROCESS

time { bash b.44.24.intel-vaapi-driver-2.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.17.xbitmaps-1.1.3"
echo "24.17.xbitmaps-1.1.3" >> $LFSLOG_PROCESS

time { bash b.24.17.xbitmaps-1.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
