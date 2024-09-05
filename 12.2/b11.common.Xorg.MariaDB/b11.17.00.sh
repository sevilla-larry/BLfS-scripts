# b11.17.00.sh
#
# Networking Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b11.17.02.cURL-8.9.1"
echo "b11.17.02.cURL-8.9.1" >> $LFSLOG_PROCESS

time { bash b11.17.02.cURL-8.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
