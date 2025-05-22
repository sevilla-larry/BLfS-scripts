# e10.03.2.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e10.10.26.libtiff-4.7.0"
echo "e10.10.26.libtiff-4.7.0" >> $LFSLOG_PROCESS

time { bash e10.10.26.libtiff-4.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.27.libwebp-1.5.0"
echo "e10.10.27.libwebp-1.5.0" >> $LFSLOG_PROCESS

time { bash e10.10.27.libwebp-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.14.LittleCMS-2.17"
echo "e10.10.14.LittleCMS-2.17" >> $LFSLOG_PROCESS

time { bash e10.10.14.LittleCMS-2.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.31.OpenJPEG-2.5.3"
echo "e10.10.31.OpenJPEG-2.5.3" >> $LFSLOG_PROCESS

time { bash e10.10.31.OpenJPEG-2.5.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.24.librsvg-2.59.2"
echo "e10.10.24.librsvg-2.59.2" >> $LFSLOG_PROCESS

time { bash e10.10.24.librsvg-2.59.2 ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.25.10.gdk-pixbuf-2.42.12"
echo "e10.25.10.gdk-pixbuf-2.42.12" >> $LFSLOG_PROCESS

time { bash e10.25.10.gdk-pixbuf-2.42.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.25.04.Cairo-1.18.2"
echo "e10.25.04.Cairo-1.18.2" >> $LFSLOG_PROCESS

time { bash e10.25.04.Cairo-1.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.25.38.Pango-1.54.1"
echo "e10.25.38.Pango-1.54.1" >> $LFSLOG_PROCESS

time { bash e10.25.38.Pango-1.54.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.12.37.UPower-1.90.7"
echo "e10.12.37.UPower-1.90.7" >> $LFSLOG_PROCESS

time { bash e10.12.37.UPower-1.90.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
