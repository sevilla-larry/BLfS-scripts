# e11.03.1.sh
#
# ending with GTK+3.24.43
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.13.35.Vala-0.56.17"
echo "e11.13.35.Vala-0.56.17" >> $LFSLOG_PROCESS

time { bash e11.13.35.Vala-0.56.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.11.11.ISO.Codes-4.16.0"
echo "e11.11.11.ISO.Codes-4.16.0" >> $LFSLOG_PROCESS

time { bash e11.11.11.ISO.Codes-4.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

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

#####

unset LFSLOG_PROCESS
