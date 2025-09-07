# d20.03.1.Part05.11.sh
#
# Graphical Environments
#
#   d20.24.11 XCB Utilities
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.11.XCB.Utilities"
echo "d20.24.11.XCB.Utilities" >> $LFSLOG_PROCESS

time { bash d20.24.11.XCB.Utilities.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
