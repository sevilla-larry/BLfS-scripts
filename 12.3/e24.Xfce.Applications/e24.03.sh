# e24.03.sh
#
# Xfce4 Apps: terminal, Ristretto, notifyd
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e24.36.02.xfce4-terminal-1.1.4"
echo "e24.36.02.xfce4-terminal-1.1.4" >> $LFSLOG_PROCESS

time { bash e24.36.02.xfce4-terminal-1.1.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e24.36.04.Ristretto-0.13.3"
echo "e24.36.04.Ristretto-0.13.3" >> $LFSLOG_PROCESS

time { bash e24.36.04.Ristretto-0.13.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e24.36.05.xfce4-notifyd-0.9.7"
echo "e24.36.05.xfce4-notifyd-0.9.7" >> $LFSLOG_PROCESS

time { bash e24.36.05.xfce4-notifyd-0.9.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
