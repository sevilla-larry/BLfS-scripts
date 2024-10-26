# e21.03.Group01.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e21.25.36.libnotify-0.8.3"
echo "e21.25.36.libnotify-0.8.3" >> $LFSLOG_PROCESS

time { bash e21.25.36.libnotify-0.8.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
