# e11.03.Group01.sh
#
# gsettings... only
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

echo "e11.25.17.GTK+-3.24.43"
echo "e11.25.17.GTK+-3.24.43" >> $LFSLOG_PROCESS

time { bash e11.25.17.GTK+-3.24.43.sh ; }

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
