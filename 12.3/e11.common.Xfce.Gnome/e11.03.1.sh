# e11.03.1.sh
#
# ending with GTK+3.24.43
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.33.03.gsettings-desktop-schemas-46.1"
echo "e11.33.03.gsettings-desktop-schemas-46.1" >> $LFSLOG_PROCESS

time { bash e11.33.03.gsettings-desktop-schemas-46.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.25.03.at-spi2-core-2.52.0"
echo "e11.25.03.at-spi2-core-2.52.0" >> $LFSLOG_PROCESS

time { bash e11.25.03.at-spi2-core-2.52.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.25.16.GTK-3.24.48"
echo "e11.25.16.GTK-3.24.48" >> $LFSLOG_PROCESS

time { bash e11.25.16.GTK-3.24.48.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.28.09.lxde-icon-theme-0.5.1"
echo "e11.28.09.lxde-icon-theme-0.5.1" >> $LFSLOG_PROCESS

time { bash e11.28.09.lxde-icon-theme-0.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.28.01.adwaita-icon-theme-46.2"
echo "e11.28.01.adwaita-icon-theme-46.2" >> $LFSLOG_PROCESS

time { bash e11.28.01.adwaita-icon-theme-46.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.28.06.gnome-themes-extra-3.28"
echo "e11.28.06.gnome-themes-extra-3.28" >> $LFSLOG_PROCESS

time { bash e11.28.06.gnome-themes-extra-3.28.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.33.07.VTE-0.76.4"
echo "e11.33.07.VTE-0.76.4" >> $LFSLOG_PROCESS

time { bash e11.33.07.VTE-0.76.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.25.13.GLU-9.0.3"
echo "e11.25.13.GLU-9.0.3" >> $LFSLOG_PROCESS

time { bash e11.25.13.GLU-9.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.41.14.XScreenSaver-6.09"
echo "e11.41.14.XScreenSaver-6.09" >> $LFSLOG_PROCESS

time { bash e11.41.14.XScreenSaver-6.09.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
