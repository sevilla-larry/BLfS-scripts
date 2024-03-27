# b.17.00.sh
#
# Networking Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "17.18.libtirpc-1.3.3"
echo "17.18.libtirpc-1.3.3" >> $LFSLOG_PROCESS

time { bash b.17.18.libtirpc-1.3.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
