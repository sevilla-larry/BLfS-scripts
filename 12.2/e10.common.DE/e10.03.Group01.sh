# e10.03.Group01.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.13.37.yasm-1.3.0"
echo "e10.13.37.yasm-1.3.0" >> $LFSLOG_PROCESS

time { bash e10.13.37.yasm-1.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.71.libxkbcommon-1.7.0"
echo "e10.09.71.libxkbcommon-1.7.0" >> $LFSLOG_PROCESS

time { bash e10.09.71.libxkbcommon-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.18.libjpeg-turbo-3.0.1"
echo "e10.10.18.libjpeg-turbo-3.0.1" >> $LFSLOG_PROCESS

time { bash e10.10.18.libjpeg-turbo-3.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
