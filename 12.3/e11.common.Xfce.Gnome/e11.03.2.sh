# e11.03.2.sh
#
# called after E14
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.09.13.enchant-2.8.2"
echo "e11.09.13.enchant-2.8.2" >> $LFSLOG_PROCESS

time { bash e11.09.13.enchant-2.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
