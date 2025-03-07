# b10.03.6.sh
#
# libevent, boost, nghttp2
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.11.21.unixODBC-2.3.12"
echo "b10.11.21.unixODBC-2.3.12" >> $LFSLOG_PROCESS

time { bash b10.11.21.unixODBC-2.3.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.07.libevent-2.1.12"
echo "b10.17.07.libevent-2.1.12" >> $LFSLOG_PROCESS

time { bash b10.17.07.libevent-2.1.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.07.boost-1.86.0"
echo "b10.09.07.boost-1.86.0" >> $LFSLOG_PROCESS

time { bash b10.09.07.boost-1.86.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.20.nghttp2-1.62.1"
echo "b10.17.20.nghttp2-1.62.1" >> $LFSLOG_PROCESS

time { bash b10.17.20.nghttp2-1.62.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
