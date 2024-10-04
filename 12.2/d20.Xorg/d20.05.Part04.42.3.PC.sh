# d20.05.Part04.42.3.PC.sh
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

echo "d20.42.41.libva-2.22.0 - before Mesa"
echo "d20.42.41.libva-2.22.0 - before Mesa" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash d20.42.41.libva-2.22.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.42.42.libvdpau-1.5"
echo "d20.42.42.libvdpau-1.5" >> $LFSLOG_PROCESS

time { bash d20.42.42.libvdpau-1.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
