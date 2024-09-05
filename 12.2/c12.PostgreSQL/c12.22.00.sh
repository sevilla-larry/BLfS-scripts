# c12.22.00.sh
#
# Databases
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "22.04.PostgreSQL-16.4"
echo "22.04.PostgreSQL-16.4" >> $LFSLOG_PROCESS

time { bash c12.22.04.PostgreSQL-16.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
