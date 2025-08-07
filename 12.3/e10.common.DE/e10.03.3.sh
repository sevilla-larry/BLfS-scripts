# e10.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.09.06.Aspell-0.60.8.1"
echo "e10.09.06.Aspell-0.60.8.1" >> $LFSLOG_PROCESS

time { bash e10.09.06.Aspell-0.60.8.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.33.libassuan-3.0.2"
echo "e10.09.33.libassuan-3.0.2" >> $LFSLOG_PROCESS

time { bash e10.09.33.libassuan-3.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.04.08.GPGME-1.24.2"
echo "e10.04.08.GPGME-1.24.2" >> $LFSLOG_PROCESS

time { bash e10.04.08.GPGME-1.24.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
