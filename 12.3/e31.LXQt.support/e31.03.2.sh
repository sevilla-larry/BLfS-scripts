# e31.03.2.sh
#
# 1. breeze-icons
# 2. LXQt Desktop Final Instructions
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e31.28.02.breeze-icons-6.11.0"
echo "e31.28.02.breeze-icons-6.11.0" >> $LFSLOG_PROCESS

time { bash e31.28.02.breeze-icons-6.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
