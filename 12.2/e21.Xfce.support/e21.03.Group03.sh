# e21.03.Group03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e21.25.04.Cairo-1.18.0"
echo "e21.25.04.Cairo-1.18.0" >> $LFSLOG_PROCESS

time { bash e21.25.04.Cairo-1.18.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.38.Pango-1.54.0"
echo "e21.25.38.Pango-1.54.0" >> $LFSLOG_PROCESS

time { bash e21.25.38.Pango-1.54.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.10.gdk-pixbuf-2.42.12"
echo "e21.25.10.gdk-pixbuf-2.42.12" >> $LFSLOG_PROCESS

time { bash e21.25.10.gdk-pixbuf-2.42.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.03.at-spi2-core-2.52.0"
echo "e21.25.03.at-spi2-core-2.52.0" >> $LFSLOG_PROCESS

time { bash e21.25.03.at-spi2-core-2.52.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
