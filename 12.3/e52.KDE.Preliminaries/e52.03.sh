# e52.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#
#	e12.29.02.extra-cmake-modules-6.11.0
#
###

echo "e52.29.03.Phonon-4.12.0"
echo "e52.29.03.Phonon-4.12.0" >> $LFSLOG_PROCESS

time { bash e52.29.03.Phonon-4.12.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e52.29.04.Phonon-backend-vlc-0.12.0"
echo "e52.29.04.Phonon-backend-vlc-0.12.0" >> $LFSLOG_PROCESS

time { bash e52.29.04.Phonon-backend-vlc-0.12.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#
#	e12.29.05.Polkit-Qt-0.200.0.0
#
###
#
#	e12.29.06.plasma-wayland-protocols-1.16.0
#
#####

unset LFSLOG_PROCESS
