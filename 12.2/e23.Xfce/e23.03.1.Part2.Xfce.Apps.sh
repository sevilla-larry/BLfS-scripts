# e23.03.1.Part2.Xfce.Apps.sh
#
# Xfce4: terminal, dev-tools, notifyd
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e23.36.02.xfce4-terminal-1.1.3"
echo "e23.36.02.xfce4-terminal-1.1.3" >> $LFSLOG_PROCESS

time { bash e23.36.02.xfce4-terminal-1.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.36.05.xfce4-dev-tools-4.18.1"
echo "e23.36.05.xfce4-dev-tools-4.18.1" >> $LFSLOG_PROCESS

time { bash e23.36.05.xfce4-dev-tools-4.18.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.36.06.xfce4-notifyd-0.9.6"
echo "e23.36.06.xfce4-notifyd-0.9.6" >> $LFSLOG_PROCESS

time { bash e23.36.06.xfce4-notifyd-0.9.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
