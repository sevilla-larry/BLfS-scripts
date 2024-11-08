# g11.03.3.sh
#
# Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.01.Cbindgen-0.27.0"
echo "g11.13.01.Cbindgen-0.27.0" >> $LFSLOG_PROCESS

time { bash g11.13.01.Cbindgen-0.27.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#    Node.js group
###

echo "g11.17.01.c-ares-1.34.2"
echo "g11.17.01.c-ares-1.34.2" >> $LFSLOG_PROCESS

time { bash g11.17.01.c-ares-1.34.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.09.80.Node.js-20.18.0"
echo "g11.09.80.Node.js-20.18.0" >> $LFSLOG_PROCESS

time { bash g11.09.80.Node.js-20.18.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#   PulseAudio group
#
###

echo "g11.42.02.alsa-lib-1.2.12"
echo "g11.42.02.alsa-lib-1.2.12" >> $LFSLOG_PROCESS

time { bash g11.42.02.alsa-lib-1.2.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.11.FLAC-1.4.3"
echo "g11.42.11.FLAC-1.4.3" >> $LFSLOG_PROCESS

time { bash g11.42.11.FLAC-1.4.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.42.44.Opus-1.5.2"
echo "g11.42.44.Opus-1.5.2" >> $LFSLOG_PROCESS

time { bash g11.42.44.Opus-1.5.2.sh ; }

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

echo "g11.42.45.libvpx-1.14.1"
echo "g11.42.45.libvpx-1.14.1" >> $LFSLOG_PROCESS

time { bash g11.42.45.libvpx-1.14.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
