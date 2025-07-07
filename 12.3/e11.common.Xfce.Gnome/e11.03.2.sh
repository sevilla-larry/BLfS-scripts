# e11.03.2.sh
#
# sound group
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.42.53.sound-theme-freedesktop-0.8"
echo "e11.42.53.sound-theme-freedesktop-0.8" >> $LFSLOG_PROCESS

time { bash e11.42.53.sound-theme-freedesktop-0.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.26.libcanberra-0.30"
echo "e11.42.26.libcanberra-0.30" >> $LFSLOG_PROCESS

time { bash e11.42.26.libcanberra-0.30.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.45.libvpx-1.15.2"
echo "e11.42.45.libvpx-1.15.2" >> $LFSLOG_PROCESS

time { bash e11.42.45.libvpx-1.15.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.24.libaom-3.12.0"
echo "e11.42.24.libaom-3.12.0" >> $LFSLOG_PROCESS

time { bash e11.42.24.libaom-3.12.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.10.15.libavif-1.2.0"
echo "e11.10.15.libavif-1.2.0" >> $LFSLOG_PROCESS

time { bash e11.10.15.libavif-1.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.09.24.highway-1.2.0"
echo "e11.09.24.highway-1.2.0" >> $LFSLOG_PROCESS

time { bash e11.09.24.highway-1.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.10.08.giflib-5.2.2"
echo "e11.10.08.giflib-5.2.2" >> $LFSLOG_PROCESS

time { bash e11.10.08.giflib-5.2.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.10.19.libjxl-0.11.1"
echo "e11.10.19.libjxl-0.11.1" >> $LFSLOG_PROCESS

time { bash e11.10.19.libjxl-0.11.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.60.x265-4.1"
echo "e11.42.60.x265-4.1" >> $LFSLOG_PROCESS

time { bash e11.42.60.x265-4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.59.x264-20250212"
echo "e11.42.59.x264-20250212" >> $LFSLOG_PROCESS

time { bash e11.42.59.x264-20250212.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.42.25.libass-0.17.3"
echo "e11.42.25.libass-0.17.3" >> $LFSLOG_PROCESS

time { bash e11.42.25.libass-0.17.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.44.01.FFmpeg-7.1"
echo "e11.44.01.FFmpeg-7.1" >> $LFSLOG_PROCESS

time { bash e11.44.01.FFmpeg-7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
