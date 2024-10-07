# e21.03.Group04.sh
#
# GTK+ 3

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e21.28.07.hicolor-icon-theme-0.18"
echo "e21.28.07.hicolor-icon-theme-0.18" >> $LFSLOG_PROCESS

time { bash e21.28.07.hicolor-icon-theme-0.18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.17.GTK+-3.24.43"
echo "e21.25.17.GTK+-3.24.43" >> $LFSLOG_PROCESS

time { bash e21.25.17.GTK+-3.24.43.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.28.01.adwaita-icon-theme-46.2"
echo "e21.28.01.adwaita-icon-theme-46.2.sh" >> $LFSLOG_PROCESS

time { bash e21.28.01.adwaita-icon-theme-46.2.sh ; }

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

#####

unset LFSLOG_PROCESS
