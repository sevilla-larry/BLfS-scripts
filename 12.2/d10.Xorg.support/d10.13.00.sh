# b.13.00.sh
#
# Programming
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

# echo "13.04.CMake-3.27.2"
# echo "13.04.CMake-3.27.2" >> $LFSLOG_PROCESS

# time { bash b.13.04.CMake-3.27.2.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

# ###

echo "13.13.LLVM-16.0.5"
echo "13.13.LLVM-16.0.5" >> $LFSLOG_PROCESS

time { bash b.13.13.LLVM-16.0.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "13.24.13.Mako-1.2.4"
echo "13.24.13.Mako-1.2.4" >> $LFSLOG_PROCESS

time { bash b.13.24.13.Mako-1.2.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
