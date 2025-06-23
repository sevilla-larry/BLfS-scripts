# g11.03.2.sh
#
# common Firefox & LibreOffice support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.10.27.libwebp-1.5.0"
echo "g11.10.27.libwebp-1.5.0" >> $LFSLOG_PROCESS

time { bash g11.10.27.libwebp-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
