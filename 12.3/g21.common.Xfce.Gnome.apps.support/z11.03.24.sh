# g11.03.24.sh
#
# Evince and Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.10.31.OpenJPEG-2.5.3"
echo "g11.10.31.OpenJPEG-2.5.3" >> $LFSLOG_PROCESS

time { bash g11.10.31.OpenJPEG-2.5.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.09.33.libassuan-3.0.2"
echo "g11.09.33.libassuan-3.0.2" >> $LFSLOG_PROCESS

time { bash g11.09.33.libassuan-3.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.04.08.GPGME-1.24.2"
echo "g11.04.08.GPGME-1.24.2" >> $LFSLOG_PROCESS

time { bash g11.04.08.GPGME-1.24.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.10.33.Poppler-25.02.0"
echo "g11.10.33.Poppler-25.02.0" >> $LFSLOG_PROCESS

time { bash g11.10.33.Poppler-25.02.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.25.16.Graphene-1.10.8"
echo "g11.25.16.Graphene-1.10.8" >> $LFSLOG_PROCESS

time { bash g11.25.16.Graphene-1.10.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.14.gstreamer-1.24.12"
echo "g11.42.14.gstreamer-1.24.12" >> $LFSLOG_PROCESS

time { bash g11.42.14.gstreamer-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.15.gst-plugins-base-1.24.12"
echo "g11.42.15.gst-plugins-base-1.24.12" >> $LFSLOG_PROCESS

time { bash g11.42.15.gst-plugins-base-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.16.gst-plugins-good-1.24.12"
echo "g11.42.16.gst-plugins-good-1.24.12" >> $LFSLOG_PROCESS

time { bash g11.42.16.gst-plugins-good-1.24.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
