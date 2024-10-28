# g11.03.2.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.25.33.libhandy-1.8.3"
echo "g11.25.33.libhandy-1.8.3" >> $LFSLOG_PROCESS

time { bash g11.25.33.libhandy-1.8.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.10.31.OpenJPEG-2.5.2"
echo "g11.10.31.OpenJPEG-2.5.2" >> $LFSLOG_PROCESS

time { bash g11.10.31.OpenJPEG-2.5.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.10.33.Poppler-24.08.0"
echo "g11.10.33.Poppler-24.08.0" >> $LFSLOG_PROCESS

time { bash g11.10.33.Poppler-24.08.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
