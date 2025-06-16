# c12.03.9.main.app.sh
#
# Databases
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "c12.22.04.PostgreSQL-17.5"
echo "c12.22.04.PostgreSQL-17.5" >> $LFSLOG_PROCESS

time { bash c12.22.04.PostgreSQL-17.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
