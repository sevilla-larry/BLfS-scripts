# e21.03.Group01.sh
#
# Yasm only
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e21.13.37.yasm-1.3.0"
echo "e21.13.37.yasm-1.3.0" >> $LFSLOG_PROCESS

time { bash e21.13.37.yasm-1.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
