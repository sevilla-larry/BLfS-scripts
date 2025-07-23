# e33.03.2.sh
#
# LXQt Desktop Final Instructions
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e33.37.40.LXQt.Desktop.Final.Instructions"
echo "e33.37.40.LXQt.Desktop.Final.Instructions" >> $LFSLOG_PROCESS

time { bash e33.37.40.LXQt.Desktop.Final.Instructions.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
