# b11.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b11.09.66.libunistring-1.2"
echo "b11.09.66.libunistring-1.2" >> $LFSLOG_PROCESS

time { bash b11.09.66.libunistring-1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b11.09.49.libidn2-2.3.7"
echo "b11.09.49.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash b11.09.49.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b11.17.14.libpsl-0.21.5"
echo "b11.17.14.libpsl-0.21.5" >> $LFSLOG_PROCESS

time { bash b11.17.14.libpsl-0.21.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b11.17.02.cURL-8.10.1"
echo "b11.17.02.cURL-8.10.1" >> $LFSLOG_PROCESS

time { bash b11.17.02.cURL-8.10.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b11.13.03.CMake-3.30.2"
echo "b11.13.03.CMake-3.30.2" >> $LFSLOG_PROCESS

time { bash b11.13.03.CMake-3.30.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS