# c11.03.9.main.app.sh
#
# Databases
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "c11.22.03.MariaDB-10.11.8"
echo "c11.22.03.MariaDB-10.11.8" >> $LFSLOG_PROCESS

time { bash c11.22.03.MariaDB-10.11.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
