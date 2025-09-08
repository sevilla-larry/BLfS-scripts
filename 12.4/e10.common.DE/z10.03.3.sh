# e11.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.42.14.gstreamer-1.24.12"
echo "e11.42.14.gstreamer-1.24.12" >> $LFSLOG_PROCESS

time { bash e11.42.14.gstreamer-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.15.gst-plugins-base-1.24.12"
echo "e11.42.15.gst-plugins-base-1.24.12" >> $LFSLOG_PROCESS

time { bash e11.42.15.gst-plugins-base-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.16.gst-plugins-good-1.24.12"
echo "e11.42.16.gst-plugins-good-1.24.12" >> $LFSLOG_PROCESS

time { bash e11.42.16.gst-plugins-good-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
