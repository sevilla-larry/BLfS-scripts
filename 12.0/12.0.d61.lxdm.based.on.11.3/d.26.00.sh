# b.26.00.sh
#
# Display Managers
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "26.02.lightdm-1.32.0"
echo "26.02.lightdm-1.32.0" >> $LFSLOG_PROCESS

time { bash d.26.02.lightdm-1.32.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
