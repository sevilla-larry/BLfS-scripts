# g11.03.3.sh
#
# Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.21.Python-3.13.0"
echo "g11.13.21.Python-3.13.0" >> $LFSLOG_PROCESS

time { bash g11.13.21.Python-3.13.0.sh ; }

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
#	no alsalib for the meantime
#
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

#####

unset LFSLOG_PROCESS
