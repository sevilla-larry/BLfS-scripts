# c13.03.1.support.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "c13.09.04.Apr-1.7.5"
echo "c13.09.04.Apr-1.7.5" >> $LFSLOG_PROCESS

time { bash c13.09.04.Apr-1.7.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "c13.09.05.Apr-Util-1.6.3"
echo "c13.09.05.Apr-Util-1.6.3" >> $LFSLOG_PROCESS

time { bash c13.09.05.Apr-Util-1.6.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
