# e11.03.2.sh
#
# sound group
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.42.49.PulseAudio-17.0"
echo "e11.42.49.PulseAudio-17.0" >> $LFSLOG_PROCESS

time { bash e11.42.49.PulseAudio-17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

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

#####

unset LFSLOG_PROCESS
