
# g62.03.Group1.sh
#
# Xfce-terminal
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g62.36.02.xfce4-terminal-1.1.3"
echo "g62.36.02.xfce4-terminal-1.1.3" >> $LFSLOG_PROCESS

time { bash g62.36.02.xfce4-terminal-1.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
