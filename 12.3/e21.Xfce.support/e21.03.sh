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

echo "e21.25.35.libnotify-0.8.4"
echo "e21.25.35.libnotify-0.8.4" >> $LFSLOG_PROCESS

time { bash e21.25.35.libnotify-0.8.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.42.startup-notification-0.12"
echo "e21.25.42.startup-notification-0.12" >> $LFSLOG_PROCESS

time { bash e21.25.42.startup-notification-0.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

### withOut GTK-4.*

echo "e21.33.07.VTE-0.78.4"
echo "e21.33.07.VTE-0.78.4" >> $LFSLOG_PROCESS

time { bash e21.33.07.VTE-0.78.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
