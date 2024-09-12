# b11.13.00.sh
#
# Programming
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "b11.13.03.CMake-3.30.2"
echo "b11.13.03.CMake-3.30.2" >> $LFSLOG_PROCESS

time { bash b11.13.03.CMake-3.30.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
