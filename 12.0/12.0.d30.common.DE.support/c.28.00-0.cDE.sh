# c.28.00-0.cDE.sh
#
# Icons
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "28.07.hicolor-icon-theme-0.17"
echo "28.07.hicolor-icon-theme-0.17" >> $LFSLOG_PROCESS

time { bash c.28.07.hicolor-icon-theme-0.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "28.09.lxde-icon-theme-0.5.1"
echo "28.09.lxde-icon-theme-0.5.1" >> $LFSLOG_PROCESS

time { bash c.28.09.lxde-icon-theme-0.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
