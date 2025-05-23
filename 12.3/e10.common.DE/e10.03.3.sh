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

#####

unset LFSLOG_PROCESS
