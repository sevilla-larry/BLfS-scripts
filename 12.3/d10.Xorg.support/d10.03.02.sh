# d10.03.02.sh
#
# LLVM
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.13.13.LLVM-19.1.7"
echo "d10.13.13.LLVM-19.1.7" >> $LFSLOG_PROCESS

time { bash d10.13.13.LLVM-19.1.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
