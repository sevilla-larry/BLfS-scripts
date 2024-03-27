# c13.20.00.sh
#
# Major Servers
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "20.01.Apache-2.4.58"
echo "20.01.Apache-2.4.58" >> $LFSLOG_PROCESS

time { bash c13.20.01.Apache-2.4.58.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
