# d20.03.1.Part10.13.sh
#
# Graphical Environments
#
#   d20.24.13
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.13.xbitmaps-1.1.3"
echo "d20.24.13.xbitmaps-1.1.3" >> $LFSLOG_PROCESS

time { bash d20.24.13.xbitmaps-1.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
