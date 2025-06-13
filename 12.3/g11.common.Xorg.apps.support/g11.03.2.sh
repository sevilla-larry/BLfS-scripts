# g11.03.2.sh
#
# common Firefox & LibreOffice support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

###
#   PulseAudio group
#
#	to libwebp
#
###

# echo "g11.42.03.alsa-plugins-1.2.12"
# echo "g11.42.03.alsa-plugins-1.2.12" >> $LFSLOG_PROCESS
#
#time { bash g11.42.03.alsa-plugins-1.2.12.sh ; }
#
#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS
#
#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."
#
#echo "g11.42.04.alsa-utils-1.2.13"
#echo "g11.42.04.alsa-utils-1.2.13" >> $LFSLOG_PROCESS
#
#time { bash g11.42.04.alsa-utils-1.2.13.sh ; }
#
#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS
#
#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

echo "g11.42.10.FLAC-1.5.0"
echo "g11.42.10.FLAC-1.5.0" >> $LFSLOG_PROCESS

time { bash g11.42.10.FLAC-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.47.Opus-1.5.2"
echo "g11.42.47.Opus-1.5.2" >> $LFSLOG_PROCESS

time { bash g11.42.47.Opus-1.5.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.55.Speex-1.2.1"
echo "g11.42.55.Speex-1.2.1" >> $LFSLOG_PROCESS

time { bash g11.42.55.Speex-1.2.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.43.04.LAME-3.100"
echo "g11.43.04.LAME-3.100" >> $LFSLOG_PROCESS

time { bash g11.43.04.LAME-3.100.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.43.05.mpg123-1.32.10"
echo "g11.43.05.mpg123-1.32.10" >> $LFSLOG_PROCESS

time { bash g11.43.05.mpg123-1.32.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.40.libsndfile-1.2.2"
echo "g11.42.40.libsndfile-1.2.2" >> $LFSLOG_PROCESS

time { bash g11.42.40.libsndfile-1.2.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.49.PulseAudio-17.0"
echo "g11.42.49.PulseAudio-17.0" >> $LFSLOG_PROCESS

time { bash g11.42.49.PulseAudio-17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.52.SDL2-2.30.11"
echo "g11.42.52.SDL2-2.30.11" >> $LFSLOG_PROCESS

time { bash g11.42.52.SDL2-2.30.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.10.27.libwebp-1.5.0"
echo "g11.10.27.libwebp-1.5.0" >> $LFSLOG_PROCESS

time { bash g11.10.27.libwebp-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
