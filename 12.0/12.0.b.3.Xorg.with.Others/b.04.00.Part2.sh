# b.04.00.Part2.sh
#
# Security
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "04.22.Shadow-4.13.Part3"
echo "04.22.Shadow-4.13.Part3" >> $LFSLOG_PROCESS

time { bash b.04.22.Shadow-4.13.Part3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "04.20.Polkit-123"
echo "04.20.Polkit-123" >> $LFSLOG_PROCESS

time { bash b.04.20.Polkit-123.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
