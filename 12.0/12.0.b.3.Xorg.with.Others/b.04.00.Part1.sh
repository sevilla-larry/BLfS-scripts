# b.04.00.Part1.sh
#
# Security
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "04.12.Linux-PAM-1.5.3"
echo "04.12.Linux-PAM-1.5.3" >> $LFSLOG_PROCESS

time { bash b.04.12.Linux-PAM-1.5.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "04.22.Shadow-4.13.Part1"
echo "04.22.Shadow-4.13.Part1" >> $LFSLOG_PROCESS

time { bash b.04.22.Shadow-4.13.Part1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "04.22.Shadow-4.13.Part2"

bash b.04.22.Shadow-4.13.Part2.sh

#####

unset LFSLOG_PROCESS
