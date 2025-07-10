# e13.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e13.12.07.Bubblewrap-0.11.0"
echo "e13.12.07.Bubblewrap-0.11.0" >> $LFSLOG_PROCESS

time { bash e13.12.07.Bubblewrap-0.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e13.25.46.xdg-desktop-portal-1.20.0"
echo "e13.25.46.xdg-desktop-portal-1.20.0" >> $LFSLOG_PROCESS

time { bash e13.25.46.xdg-desktop-portal-1.20.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
