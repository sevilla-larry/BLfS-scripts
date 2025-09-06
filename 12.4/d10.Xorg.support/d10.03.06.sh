# d10.03.06.sh
#
# Wayland support
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.99.Wayland-1.24.0"
echo "d10.09.99.Wayland-1.24.0" >> $LFSLOG_PROCESS

time { bash d10.09.99.Wayland-1.24.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.A0.Wayland-Protocols-1.45"
echo "d10.09.A0.Wayland-Protocols-1.45" >> $LFSLOG_PROCESS

time { bash d10.09.A0.Wayland-Protocols-1.45.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
