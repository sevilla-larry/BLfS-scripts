# b10.03.4.sh
#
# Dependencies of
#   ProFTPD
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.09.63.libssh2-1.11.1"
echo "b10.09.63.libssh2-1.11.1" >> $LFSLOG_PROCESS

time { bash b10.09.63.libssh2-1.11.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
