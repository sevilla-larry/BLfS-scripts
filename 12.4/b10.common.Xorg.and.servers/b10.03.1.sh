# b10.03.1.sh
#
# Common with MariaDB, Apache, LibreOffice and OpenStack
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.11.21.unixODBC-2.3.12"
echo "b10.11.21.unixODBC-2.3.12" >> $LFSLOG_PROCESS

time { bash b10.11.21.unixODBC-2.3.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
