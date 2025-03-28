# d20.03.1.Part03.12.10.sh
#
# dbus only
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.12.10.dbus-1.14.10.Pass2"
echo "d20.12.10.dbus-1.14.10.Pass2" >> $LFSLOG_PROCESS

time { bash d20.12.10.dbus-1.14.10.Pass2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
