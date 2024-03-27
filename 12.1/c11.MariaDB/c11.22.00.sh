# c11.22.00.sh
#
# Databases
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "22.03.MariaDB-10.11.7"
echo "22.03.MariaDB-10.11.7" >> $LFSLOG_PROCESS

time { bash c11.22.03.MariaDB-10.11.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
