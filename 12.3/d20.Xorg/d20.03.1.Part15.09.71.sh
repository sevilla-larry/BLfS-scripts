# d20.03.1.Part15.09.71.sh
#
# libxkbcommon
#
#   d20.09.71
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#		libepoxy is recommended but needed by Xorg-Server
###

echo "d20.09.71.libxkbcommon-1.8.0 - Pass 1"
echo "d20.09.71.libxkbcommon-1.8.0 - Pass 1" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash d20.09.71.libxkbcommon-1.8.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
