# d20.05.Part06.42.3.PC.sh
#
# Graphical Environments
#
#   for Haswell or earlier
#   using i7-4790
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.42.41.libva-2.22.0 - after Mesa"
echo "d20.42.41.libva-2.22.0 - after Mesa" >> $LFSLOG_PROCESS

export PKGPASS=2
time { bash d20.42.41.libva-2.22.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.42.22.intel-vaapi-driver-2.4.1"
echo "d20.42.22.intel-vaapi-driver-2.4.1" >> $LFSLOG_PROCESS

time { bash d20.42.22.intel-vaapi-driver-2.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.42.43.libvdpau-va-gl-0.4.2"
echo "d20.42.43.libvdpau-va-gl-0.4.2" >> $LFSLOG_PROCESS

time { bash d20.42.43.libvdpau-va-gl-0.4.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
