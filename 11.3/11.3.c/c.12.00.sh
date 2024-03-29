# c.12.00.sh
#
# System Utilities
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "12.33.UnZip-6.0"
echo "12.33.UnZip-6.0" >> $LFSLOG_PROCESS

time { bash c.12.33.UnZip-6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.36.Which-2.21"
echo "12.36.Which-2.21" >> $LFSLOG_PROCESS

time { bash c.12.36.Which-2.21.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "12.10.dbus-1.14.8"
echo "12.10.dbus-1.14.8" >> $LFSLOG_PROCESS

time { bash c.12.10.dbus-1.14.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
