# b.09.00.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "09.09.duktape-2.7.0"
echo "09.09.duktape-2.7.0" >> $LFSLOG_PROCESS

time { bash b.09.09.duktape-2.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# # compile ahead.  needed by GLib
# echo "09.80.PCRE2-10.42"
# echo "09.80.PCRE2-10.42" >> $LFSLOG_PROCESS

# time { bash b.09.80.PCRE2-10.42.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

# PCRE2 - subproject of GLib

###

echo "09.13.GLib-2.76.4"
echo "09.13.GLib-2.76.4" >> $LFSLOG_PROCESS

time { bash b.09.13.GLib-2.76.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.16.gobject-introspection-1.76.1"
echo "09.16.gobject-introspection-1.76.1" >> $LFSLOG_PROCESS

time { bash b.09.16.gobject-introspection-1.76.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

# ### transferred to b10 common to Xorg and servers

# echo "09.68.libxml2-2.10.4"
# echo "09.68.libxml2-2.10.4" >> $LFSLOG_PROCESS

# time { bash b.09.68.libxml2-2.10.4.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "09.75.mtdev-1.1.6"
echo "09.75.mtdev-1.1.6" >> $LFSLOG_PROCESS

time { bash b.09.75.mtdev-1.1.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.88.Wayland-1.22.0"
echo "09.88.Wayland-1.22.0" >> $LFSLOG_PROCESS

time { bash b.09.88.Wayland-1.22.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.89.Wayland-Protocols-1.32"
echo "09.89.Wayland-Protocols-1.32" >> $LFSLOG_PROCESS

time { bash b.09.89.Wayland-Protocols-1.32.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
