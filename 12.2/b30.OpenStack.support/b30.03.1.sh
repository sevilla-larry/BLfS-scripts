# b30.03.1.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b30.15.04.Net-tools-2.10"
echo "b30.15.04.Net-tools-2.10" >> $LFSLOG_PROCESS

time { bash b30.15.04.Net-tools-2.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.09.51.liblinear-247"
echo "b30.09.51.liblinear-247" >> $LFSLOG_PROCESS

time { bash b30.09.51.liblinear-247.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.17.10.libnl-3.10.0"
echo "b30.17.10.libnl-3.10.0" >> $LFSLOG_PROCESS

time { bash b30.17.10.libnl-3.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.17.13.libpcap-1.10.4"
echo "b30.17.13.libpcap-1.10.4" >> $LFSLOG_PROCESS

time { bash b30.17.13.libpcap-1.10.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.13.13.Lua-5.4.7"
echo "b30.13.13.Lua-5.4.7" >> $LFSLOG_PROCESS

time { bash b30.13.13.Lua-5.4.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.16.05.Nmap-7.95"
echo "b30.16.05.Nmap-7.95" >> $LFSLOG_PROCESS

time { bash b30.16.05.Nmap-7.95.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.11.12.lsof-4.99.0"
echo "b30.11.12.lsof-4.99.0" >> $LFSLOG_PROCESS

time { bash b30.11.12.lsof-4.99.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.04.09.iptables-1.8.10"
echo "b30.04.09.iptables-1.8.10" >> $LFSLOG_PROCESS

time { bash b30.04.09.iptables-1.8.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.09.76.libyaml-0.2.5"
echo "b30.09.76.libyaml-0.2.5" >> $LFSLOG_PROCESS

time { bash b30.09.76.libyaml-0.2.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
