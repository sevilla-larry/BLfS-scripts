# c13.03.9.main.app.sh
#
# Major Servers
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "c13.20.01.Apache-2.4.62"
echo "c13.20.01.Apache-2.4.62" >> $LFSLOG_PROCESS

time { bash c13.20.01.Apache-2.4.62.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
