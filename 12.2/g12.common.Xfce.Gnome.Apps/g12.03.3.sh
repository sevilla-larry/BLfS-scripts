# g12.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g12.40.03.Firefox-128.6.0esr"
echo "g12.40.03.Firefox-128.6.0esr" >> $LFSLOG_PROCESS

time { bash g12.40.03.Firefox-128.6.0esr.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
