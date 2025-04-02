# g12.03.4.2.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g12.39.03.LibreOffice-25.2.1.Part2"
echo "g12.39.03.LibreOffice-25.2.1.Part2" >> $LFSLOG_PROCESS

time { bash g12.39.03.LibreOffice-25.2.1.Part2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
