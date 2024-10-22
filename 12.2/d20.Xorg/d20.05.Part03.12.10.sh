# d20.05.Part03.12.10.sh
#
# dbus only
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.12.10.dbus-1.14.10"
echo "d10.12.10.dbus-1.14.10" >> $LFSLOG_PROCESS

time { bash d10.12.10.dbus-1.14.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
