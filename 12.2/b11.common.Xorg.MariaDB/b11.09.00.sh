# b10.09.00.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b11.09.66.libunistring-1.2"
echo "b11.09.66.libunistring-1.2" >> $LFSLOG_PROCESS

time { bash b11.09.66.libunistring-1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b11.09.49.libidn2-2.3.7"
echo "b11.09.49.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash b11.09.49.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
