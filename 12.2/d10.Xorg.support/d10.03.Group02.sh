# d10.03.Group02.sh
#
# Git
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.13.09.Git-2.46.0"
echo "d10.13.09.Git-2.46.0" >> $LFSLOG_PROCESS

time { bash d10.13.09.Git-2.46.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
