# b00.04.00.sh
#
# Security
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "04.12.Linux-PAM-1.5.3"
echo "04.12.Linux-PAM-1.5.3" >> $LFSLOG_PROCESS

time { bash b00.04.12.Linux-PAM-1.5.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "04.22.Shadow-4.13"
echo "04.22.Shadow-4.13" >> $LFSLOG_PROCESS

time { bash b00.04.22.Shadow-4.13.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
