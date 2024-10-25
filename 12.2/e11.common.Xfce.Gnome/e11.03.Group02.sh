# e11.03.Group02.sh
#
# gstreamer
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.42.14.gstreamer-1.24.7"
echo "e11.42.14.gstreamer-1.24.7" >> $LFSLOG_PROCESS

time { bash e11.42.14.gstreamer-1.24.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.15.gst-plugins-base-1.24.7"
echo "e11.42.15.gst-plugins-base-1.24.7" >> $LFSLOG_PROCESS

time { bash e11.42.15.gst-plugins-base-1.24.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.16.gst-plugins-good-1.24.7"
echo "e11.42.16.gst-plugins-good-1.24.7" >> $LFSLOG_PROCESS

time { bash e11.42.16.gst-plugins-good-1.24.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.17.gst-plugins-bad-1.24.7"
echo "e11.42.17.gst-plugins-bad-1.24.7" >> $LFSLOG_PROCESS

time { bash e11.42.17.gst-plugins-bad-1.24.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
