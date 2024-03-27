# d.11.00-0.cDM.sh
#
# General Utilities
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "11.11.ISO.Codes-4.15.0"
echo "11.11.ISO.Codes-4.15.0" >> $LFSLOG_PROCESS

time { bash d.11.11.ISO.Codes-4.15.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
