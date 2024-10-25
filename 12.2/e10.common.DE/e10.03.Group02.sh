# e10.03.Group02.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e10.10.06.FriBidi-1.0.15"
echo "e10.10.06.FriBidi-1.0.15" >> $LFSLOG_PROCESS

time { bash e10.10.06.FriBidi-1.0.15.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.18.libjpeg-turbo-3.0.1"
echo "e10.10.18.libjpeg-turbo-3.0.1" >> $LFSLOG_PROCESS

time { bash e10.10.18.libjpeg-turbo-3.0.1.sh ; }

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

echo "e10.25.04.Cairo-1.18.0"
echo "e10.25.04.Cairo-1.18.0" >> $LFSLOG_PROCESS

time { bash e10.25.04.Cairo-1.18.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.25.38.Pango-1.54.0"
echo "e10.25.38.Pango-1.54.0" >> $LFSLOG_PROCESS

time { bash e10.25.38.Pango-1.54.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
