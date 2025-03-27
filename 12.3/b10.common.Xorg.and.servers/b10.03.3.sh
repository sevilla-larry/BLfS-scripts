# b10.03.3.sh
#
# Dependencies of
#   Apache
# SQLite

#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "b10.22.05.SQLite-3.49.1"
echo "b10.22.05.SQLite-3.49.1" >> $LFSLOG_PROCESS

time { bash b10.22.05.SQLite-3.49.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
