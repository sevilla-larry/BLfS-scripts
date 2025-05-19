# e21.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e21.09.41.libdisplay-info-0.2.0"
echo "e21.09.41.libdisplay-info-0.2.0" >> $LFSLOG_PROCESS

time { bash e21.09.41.libdisplay-info-0.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.36.libnotify-0.8.4"
echo "e21.25.36.libnotify-0.8.4" >> $LFSLOG_PROCESS

time { bash e21.25.36.libnotify-0.8.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.44.startup-notification-0.12"
echo "e21.25.44.startup-notification-0.12" >> $LFSLOG_PROCESS

time { bash e21.25.44.startup-notification-0.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
