# c.33.00-0.cDE.sh
#
# GNOME Libraries and Desktop
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "33.03.gsettings-desktop-schemas-44.0"
echo "33.03.gsettings-desktop-schemas-44.0" >> $LFSLOG_PROCESS

time { bash c.33.03.gsettings-desktop-schemas-44.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
