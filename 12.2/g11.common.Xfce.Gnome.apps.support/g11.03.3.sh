# g11.03.3.sh
#
# Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.21.Python-3.12.7"
echo "g11.13.21.Python-3.12.7" >> $LFSLOG_PROCESS

time { bash g11.13.21.Python-3.12.7.sh ; }

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

echo "g11.09.08.brotli-1.1.0"
echo "g11.09.08.brotli-1.1.0" >> $LFSLOG_PROCESS

time { bash g11.09.08.brotli-1.1.0.sh ; }

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
#    PulseAudio group
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
#	NSS group
###

echo "g11.09.82.NSPR-4.36"
echo "g11.09.82.NSPR-4.36" >> $LFSLOG_PROCESS

time { bash g11.09.82.NSPR-4.36.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.04.17.NSS-3.106"
echo "g11.04.17.NSS-3.106" >> $LFSLOG_PROCESS

time { bash g11.04.17.NSS-3.106.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
