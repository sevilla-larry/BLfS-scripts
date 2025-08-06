# e10.03.6.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.09.24.highway-1.2.0"
echo "e10.09.24.highway-1.2.0" >> $LFSLOG_PROCESS

time { bash e10.09.24.highway-1.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.15.libavif-1.2.0"
echo "e10.10.15.libavif-1.2.0" >> $LFSLOG_PROCESS

time { bash e10.10.15.libavif-1.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.19.libjxl-0.11.1"
echo "e10.10.19.libjxl-0.11.1" >> $LFSLOG_PROCESS

time { bash e10.10.19.libjxl-0.11.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.47.libical-3.0.19"
echo "e10.09.47.libical-3.0.19" >> $LFSLOG_PROCESS

time { bash e10.09.47.libical-3.0.19.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
