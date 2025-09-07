# d20.03.1.Part14.09.73.sh
#
# libxkbcommon
#
#   d20.09.73
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#		libepoxy is recommended but needed by Xorg-Server
###

echo "d20.09.73.libxkbcommon-1.11.0 - Pass 1"
echo "d20.09.73.libxkbcommon-1.11.0 - Pass 1" >> $LFSLOG_PROCESS

time { bash d20.09.73.libxkbcommon-1.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
