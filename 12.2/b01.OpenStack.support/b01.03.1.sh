# b01.03.1.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b01.09.51.liblinear-247"
echo "b01.09.51.liblinear-247" >> $LFSLOG_PROCESS

time { bash b01.09.51.liblinear-247.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b01.17.10.libnl-3.10.0"
echo "b01.17.10.libnl-3.10.0" >> $LFSLOG_PROCESS

time { bash b01.17.10.libnl-3.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b01.17.13.libpcap-1.10.4"
echo "b01.17.13.libpcap-1.10.4" >> $LFSLOG_PROCESS

time { bash b01.17.13.libpcap-1.10.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b01.13.13.Lua-5.4.7"
echo "b01.13.13.Lua-5.4.7" >> $LFSLOG_PROCESS

time { bash b01.13.13.Lua-5.4.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b01.16.05.Nmap-7.95"
echo "b01.16.05.Nmap-7.95" >> $LFSLOG_PROCESS

time { bash b01.16.05.Nmap-7.95.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
