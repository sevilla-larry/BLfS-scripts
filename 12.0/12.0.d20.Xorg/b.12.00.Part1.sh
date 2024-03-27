# b.12.00.Part1.sh
#
# System Utilities
#
# dbus only

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "12.10.dbus-1.14.8"
echo "12.10.dbus-1.14.8" >> $LFSLOG_PROCESS

time { bash b.12.10.dbus-1.14.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
