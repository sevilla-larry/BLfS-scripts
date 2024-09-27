# d10.09.00.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

#echo "09.09.duktape-2.7.0"
#echo "09.09.duktape-2.7.0" >> $LFSLOG_PROCESS

#time { bash b.09.09.duktape-2.7.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

echo "d10.09.17.GLib-2.80.4"
echo "d10.09.17.GLib-2.80.4" >> $LFSLOG_PROCESS

time { bash d10.09.17.GLib-2.80.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#echo "09.16.gobject-introspection-1.76.1"
#echo "09.16.gobject-introspection-1.76.1" >> $LFSLOG_PROCESS

#time { bash b.09.16.gobject-introspection-1.76.1.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

echo "d10.09.74.libxslt-1.1.42"
echo "d10.09.74.libxslt-1.1.42" >> $LFSLOG_PROCESS

time { bash d10.09.74.libxslt-1.1.42.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#echo "09.75.mtdev-1.1.6"
#echo "09.75.mtdev-1.1.6" >> $LFSLOG_PROCESS

#time { bash b.09.75.mtdev-1.1.6.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

#echo "09.88.Wayland-1.22.0"
#echo "09.88.Wayland-1.22.0" >> $LFSLOG_PROCESS

#time { bash b.09.88.Wayland-1.22.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

#echo "09.89.Wayland-Protocols-1.32"
#echo "09.89.Wayland-Protocols-1.32" >> $LFSLOG_PROCESS

#time { bash b.09.89.Wayland-Protocols-1.32.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

#####

unset LFSLOG_PROCESS
