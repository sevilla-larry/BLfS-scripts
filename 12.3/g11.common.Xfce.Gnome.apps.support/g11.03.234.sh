# g11.03.234.sh
#
# Evince, Firefox & LibreOffice support
#
# NSS
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.04.17.NSS-3.108"
echo "g11.04.17.NSS-3.108" >> $LFSLOG_PROCESS

time { bash g11.04.17.NSS-3.108.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
