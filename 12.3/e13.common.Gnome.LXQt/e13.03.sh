# e13.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e13.25.48.xdg-desktop-portal-1.18.2"
echo "e13.25.48.xdg-desktop-portal-1.18.2" >> $LFSLOG_PROCESS

time { bash e13.25.48.xdg-desktop-portal-1.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
