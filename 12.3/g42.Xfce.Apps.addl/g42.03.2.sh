# g42.03.2.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g63.41.12.xarchiver-0.5.4.23"
echo "g63.41.12.xarchiver-0.5.4.23" >> $LFSLOG_PROCESS

time { bash g63.41.12.xarchiver-0.5.4.23.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
