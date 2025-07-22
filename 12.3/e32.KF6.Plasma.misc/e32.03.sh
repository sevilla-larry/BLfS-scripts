# e32.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e32.37.02.kwindowsystem-6.11.0.for.lxqt"
echo "e32.37.02.kwindowsystem-6.11.0.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.02.kwindowsystem-6.11.0.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.03.kconfig-6.11.0.for.lxqt"
echo "e32.37.03.kconfig-6.11.0.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.03.kconfig-6.11.0.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.04.solid-6.11.0.for.lxqt"
echo "e32.37.04.solid-6.11.0.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.04.solid-6.11.0.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.05.kidletime-6.11.0.for.lxqt"
echo "e32.37.05.kidletime-6.11.0.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.05.kidletime-6.11.0.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.06.kwayland-6.3.2.for.lxqt"
echo "e32.37.06.kwayland-6.3.2.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.06.kwayland-6.3.2.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.07.libkscreen-6.3.2.for.lxqt"
echo "e32.37.07.libkscreen-6.3.2.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.07.libkscreen-6.3.2.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.08.layer-shell-qt-6.3.2.for.lxqt"
echo "e32.37.08.layer-shell-qt-6.3.2.for.lxqt" >> $LFSLOG_PROCESS

time { bash e32.37.08.layer-shell-qt-6.3.2.for.lxqt.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e32.37.09.muparser-2.3.5"
echo "e32.37.09.muparser-2.3.5" >> $LFSLOG_PROCESS

time { bash e32.37.09.muparser-2.3.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
