# e11.03.Group03.sh
#
# starting with GTK-4.14.5
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.25.18.GTK-4.14.5"
echo "e11.25.18.GTK-4.14.5" >> $LFSLOG_PROCESS

time { bash e11.25.18.GTK-4.14.5.sh ; }

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

echo "e11.28.09.lxde-icon-theme-0.5.1"
echo "e11.28.09.lxde-icon-theme-0.5.1" >> $LFSLOG_PROCESS

time { bash e11.28.09.lxde-icon-theme-0.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.04.07.GnuTLS-3.8.7.1"
echo "e11.04.07.GnuTLS-3.8.7.1" >> $LFSLOG_PROCESS

time { bash e11.04.07.GnuTLS-3.8.7.1.sh ; }

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

#####

unset LFSLOG_PROCESS
