# e10.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e10.09.65.libtasn1-4.20.0"
echo "e10.09.65.libtasn1-4.20.0" >> $LFSLOG_PROCESS

time { bash e10.09.65.libtasn1-4.20.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.08.brotli-1.1.0"
echo "e10.09.08.brotli-1.1.0" >> $LFSLOG_PROCESS

time { bash e10.09.08.brotli-1.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.04.07.GnuTLS-3.8.9"
echo "e10.04.07.GnuTLS-3.8.9" >> $LFSLOG_PROCESS

time { bash e10.04.07.GnuTLS-3.8.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
