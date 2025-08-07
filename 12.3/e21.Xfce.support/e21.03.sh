# e21.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

### withOut GTK-4.*

echo "e21.04.21.polkit-gnome-0.105"
echo "e21.04.21.polkit-gnome-0.105" >> $LFSLOG_PROCESS

time { bash e21.04.21.polkit-gnome-0.105.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.36.libxklavier-5.4"
echo "e21.25.36.libxklavier-5.4" >> $LFSLOG_PROCESS

time { bash e21.25.36.libxklavier-5.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.28.01.adwaita-icon-theme-47.0"
echo "e21.28.01.adwaita-icon-theme-47.0" >> $LFSLOG_PROCESS

time { bash e21.28.01.adwaita-icon-theme-47.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.28.09.lxde-icon-theme-0.5.1"
echo "e21.28.09.lxde-icon-theme-0.5.1" >> $LFSLOG_PROCESS

time { bash e21.28.09.lxde-icon-theme-0.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.33.07.VTE-0.78.4"
echo "e21.33.07.VTE-0.78.4" >> $LFSLOG_PROCESS

time { bash e21.33.07.VTE-0.78.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e42.41.14.XScreenSaver-6.09"
echo "e42.41.14.XScreenSaver-6.09" >> $LFSLOG_PROCESS

time { bash e42.41.14.XScreenSaver-6.09.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
