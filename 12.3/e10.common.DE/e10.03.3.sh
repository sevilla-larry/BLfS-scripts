# e10.03.3.sh
#
# sound group
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.42.01.alsa-lib-1.2.13"
echo "e10.42.01.alsa-lib-1.2.13" >> $LFSLOG_PROCESS

time { bash e10.42.01.alsa-lib-1.2.13.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.37.libogg-1.3.5"
echo "e10.42.37.libogg-1.3.5" >> $LFSLOG_PROCESS

time { bash e10.42.37.libogg-1.3.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.44.libvorbis-1.3.7"
echo "e10.42.44.libvorbis-1.3.7" >> $LFSLOG_PROCESS

time { bash e10.42.44.libvorbis-1.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.10.FLAC-1.5.0"
echo "e10.42.10.FLAC-1.5.0" >> $LFSLOG_PROCESS

time { bash e10.42.10.FLAC-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.47.Opus-1.5.2"
echo "e10.42.47.Opus-1.5.2" >> $LFSLOG_PROCESS

time { bash e10.42.47.Opus-1.5.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.55.Speex-1.2.1"
echo "e10.42.55.Speex-1.2.1" >> $LFSLOG_PROCESS

time { bash e10.42.55.Speex-1.2.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.43.04.LAME-3.100"
echo "e10.43.04.LAME-3.100" >> $LFSLOG_PROCESS

time { bash e10.43.04.LAME-3.100.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.43.05.mpg123-1.32.10"
echo "e10.43.05.mpg123-1.32.10" >> $LFSLOG_PROCESS

time { bash e10.43.05.mpg123-1.32.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.40.libsndfile-1.2.2"
echo "e10.42.40.libsndfile-1.2.2" >> $LFSLOG_PROCESS

time { bash e10.42.40.libsndfile-1.2.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.49.PulseAudio-17.0"
echo "e10.42.49.PulseAudio-17.0" >> $LFSLOG_PROCESS

time { bash e10.42.49.PulseAudio-17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.42.52.SDL2-2.30.11"
echo "e10.42.52.SDL2-2.30.11" >> $LFSLOG_PROCESS

time { bash e10.42.52.SDL2-2.30.11.sh ; }

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

#####

unset LFSLOG_PROCESS
