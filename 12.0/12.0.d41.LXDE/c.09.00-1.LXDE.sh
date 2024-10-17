# c.09.00-1.LXDE.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "09.07.dbus-glib-0.112"
echo "09.07.dbus-glib-0.112" >> $LFSLOG_PROCESS

time { bash c.09.07.dbus-glib-0.112.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

##

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "09.61.libunique-1.1.6"
echo "09.61.libunique-1.1.6" >> $LFSLOG_PROCESS

time { bash c.09.61.libunique-1.1.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
