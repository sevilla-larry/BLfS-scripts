# c14.03.9.main.app.sh
#
# Major Servers
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "20.04.ProFTPD-1.3.9"
echo "20.04.ProFTPD-1.3.9" >> $LFSLOG_PROCESS

time { bash c14.20.04.ProFTPD-1.3.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
