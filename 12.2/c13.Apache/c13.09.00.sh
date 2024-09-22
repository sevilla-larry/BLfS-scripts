# b13.09.00.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "09.04.Apr-1.7.4"
echo "09.04.Apr-1.7.4" >> $LFSLOG_PROCESS

time { bash c13.09.04.Apr-1.7.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.05.Apr-Util-1.6.3"
echo "09.05.Apr-Util-1.6.3" >> $LFSLOG_PROCESS

time { bash c13.09.05.Apr-Util-1.6.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
