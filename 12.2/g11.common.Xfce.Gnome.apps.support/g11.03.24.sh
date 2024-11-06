# g11.03.24.sh
#
# Evince and Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.09.33.libassuan-3.0.1"
echo "g11.09.33.libassuan-3.0.1" >> $LFSLOG_PROCESS

time { bash g11.09.33.libassuan-3.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.04.08.GPGME-1.23.2"
echo "g11.04.08.GPGME-1.23.2" >> $LFSLOG_PROCESS

time { bash g11.04.08.GPGME-1.23.2.sh ; }

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
