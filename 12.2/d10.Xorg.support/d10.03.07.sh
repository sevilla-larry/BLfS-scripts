# d10.03.07.sh
#
# Wayland support
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.97.Wayland-1.23.0"
echo "d10.09.97.Wayland-1.23.0" >> $LFSLOG_PROCESS

time { bash d10.09.97.Wayland-1.23.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.98.Wayland-Protocols-1.38"
echo "d10.09.98.Wayland-Protocols-1.38" >> $LFSLOG_PROCESS

time { bash d10.09.98.Wayland-Protocols-1.38.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
