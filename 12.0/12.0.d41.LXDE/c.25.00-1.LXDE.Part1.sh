# c.25.00-1.LXDE.sh
#
# Graphical Environment Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

##### 1st common

echo "25.02.at-spi2-core-2.48.3"
echo "25.02.at-spi2-core-2.48.3" >> $LFSLOG_PROCESS

time { bash c.25.02.at-spi2-core-2.48.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "25.12.gdk-pixbuf-2.42.10"
echo "25.12.gdk-pixbuf-2.42.10" >> $LFSLOG_PROCESS

time { bash c.25.12.gdk-pixbuf-2.42.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

###

# Cairo before Pango
echo "25.03.Cairo-1.17.6"
echo "25.03.Cairo-1.17.6" >> $LFSLOG_PROCESS

time { bash c.25.03.Cairo-1.17.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

# Pango before GTK+
echo "25.43.Pango-1.50.14"
echo "25.43.Pango-1.50.14" >> $LFSLOG_PROCESS

time { bash c.25.43.Pango-1.50.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "25.19.GTK+-2.24.33"
echo "25.19.GTK+-2.24.33" >> $LFSLOG_PROCESS

time { bash c.25.19.GTK+-2.24.33.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

##### then specific to LXDE

echo "25.13.gdk-pixbuf-xlib-2.40.2"
echo "25.13.gdk-pixbuf-xlib-2.40.2" >> $LFSLOG_PROCESS

time { bash c.25.13.gdk-pixbuf-xlib-2.40.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "25.40.libglade-2.6.4"
echo "25.40.libglade-2.6.4" >> $LFSLOG_PROCESS

time { bash c.25.40.libglade-2.6.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
