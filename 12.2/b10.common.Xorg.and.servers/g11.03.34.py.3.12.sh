# g11.03.34.sh
#
# Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.21.Python-3.12.8"
echo "g11.13.21.Python-3.12.8" >> $LFSLOG_PROCESS

time { bash g11.13.21.Python-3.12.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.13.26.Rustc-1.80.1"
echo "g11.13.26.Rustc-1.80.1" >> $LFSLOG_PROCESS

time { bash g11.13.26.Rustc-1.80.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
