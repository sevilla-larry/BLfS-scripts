# e11.03.4.sh
#
# Screen Saver
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e11.25.13.GLU-9.0.3"
echo "e11.25.13.GLU-9.0.3" >> $LFSLOG_PROCESS

time { bash e11.25.13.GLU-9.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e11.41.14.XScreenSaver-6.09"
echo "e11.41.14.XScreenSaver-6.09" >> $LFSLOG_PROCESS

time { bash e11.41.14.XScreenSaver-6.09.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
