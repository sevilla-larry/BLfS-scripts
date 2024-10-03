# d20.24.Part05.16.3.PC.sh
#
# Graphical Environments
#
#   d20.24.16 Mesa	- for PC
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

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
