# e34.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e34.38.01.lximage-qt-2.1.1"
echo "e34.38.01.lximage-qt-2.1.1" >> $LFSLOG_PROCESS

time { bash e34.38.01.lximage-qt-2.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.02.lxqt-archiver-1.1.0"
echo "e34.38.02.lxqt-archiver-1.1.0" >> $LFSLOG_PROCESS

time { bash e34.38.02.lxqt-archiver-1.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.03.lxqt-notificationd-2.1.1"
echo "e34.38.03.lxqt-notificationd-2.1.1" >> $LFSLOG_PROCESS

time { bash e34.38.03.lxqt-notificationd-2.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.04.pavucontrol-qt-2.1.0"
echo "e34.38.04.pavucontrol-qt-2.1.0" >> $LFSLOG_PROCESS

time { bash e34.38.04.pavucontrol-qt-2.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.05.qps-2.10.0"
echo "e34.38.05.qps-2.10.0" >> $LFSLOG_PROCESS

time { bash e34.38.05.qps-2.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.06.qtermwidget-2.1.0"
echo "e34.38.06.qtermwidget-2.1.0" >> $LFSLOG_PROCESS

time { bash e34.38.06.qtermwidget-2.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.07.qterminal-2.1.0"
echo "e34.38.07.qterminal-2.1.0" >> $LFSLOG_PROCESS

time { bash e34.38.07.qterminal-2.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e34.38.08.screengrab-2.9.0"
echo "e34.38.08.screengrab-2.9.0" >> $LFSLOG_PROCESS

time { bash e34.38.08.screengrab-2.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
