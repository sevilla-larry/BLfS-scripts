# c.27.00-1.LXDE.sh
#
# Window Managers
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "27.03.openbox-3.6.1"
echo "27.03.openbox-3.6.1" >> $LFSLOG_PROCESS

time { bash c.27.03.openbox-3.6.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
