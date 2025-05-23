# e10.03.1.sh
#
# RustC only
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.13.27.Rustc-1.85.0"
echo "e10.13.27.Rustc-1.85.0" >> $LFSLOG_PROCESS

time { bash e10.13.27.Rustc-1.85.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
