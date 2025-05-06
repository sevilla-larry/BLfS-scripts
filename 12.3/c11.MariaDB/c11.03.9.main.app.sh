# c11.03.9.main.app.sh
#
# Databases
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "c11.22.03.MariaDB-11.4.5"
echo "c11.22.03.MariaDB-11.4.5" >> $LFSLOG_PROCESS

time { bash c11.22.03.MariaDB-11.4.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
