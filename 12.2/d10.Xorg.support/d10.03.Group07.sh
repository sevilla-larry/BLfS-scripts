# d10.03.Group07.sh
#
# LLVM
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "d10.13.12.LLVM-18.1.7"
echo "d10.13.12.LLVM-18.1.7" >> $LFSLOG_PROCESS

time { bash d10.13.12.LLVM-18.1.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
