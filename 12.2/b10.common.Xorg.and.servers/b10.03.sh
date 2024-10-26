# b10.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.09.24.icu-75.1"
echo "b10.09.24.icu-75.1" >> $LFSLOG_PROCESS

time { bash b10.09.24.icu-75.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.72.libxml2-2.13.3"
echo "b10.09.72.libxml2-2.13.3" >> $LFSLOG_PROCESS

time { bash b10.09.72.libxml2-2.13.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
