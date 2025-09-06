# d10.03.02.sh
#
# LLVM
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.13.13.LLVM-20.1.8"
echo "d10.13.13.LLVM-20.1.8" >> $LFSLOG_PROCESS

time { bash d10.13.13.LLVM-20.1.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
