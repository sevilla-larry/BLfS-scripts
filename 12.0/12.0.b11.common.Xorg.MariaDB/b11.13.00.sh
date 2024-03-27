# b11.13.00.sh
#
# Programming
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "13.04.CMake-3.28.1"
echo "13.04.CMake-3.28.1" >> $LFSLOG_PROCESS

time { bash b11.13.04.CMake-3.28.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
