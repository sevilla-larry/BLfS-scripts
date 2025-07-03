# b10.03.5.sh
#
# Common with OpenStack
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.13.14.Lua-5.4.7"
echo "b10.13.14.Lua-5.4.7" >> $LFSLOG_PROCESS

time { bash b10.13.14.Lua-5.4.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.13.Mako-1.3.9"
echo "b10.13.24.13.Mako-1.3.9" >> $LFSLOG_PROCESS

time { bash b10.13.24.13.Mako-1.3.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.17.psutil-7.0.0"
echo "b10.13.24.17.psutil-7.0.0" >> $LFSLOG_PROCESS

time { bash b10.13.24.17.psutil-7.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.76.libyaml-0.2.5"
echo "b10.09.76.libyaml-0.2.5" >> $LFSLOG_PROCESS

time { bash b10.09.76.libyaml-0.2.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.28.PyYAML-6.0.2"
echo "b10.13.24.28.PyYAML-6.0.2" >> $LFSLOG_PROCESS

time { bash b10.13.24.28.PyYAML-6.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.41.pyproject_hooks-1.2.0"
echo "b10.13.24.41.pyproject_hooks-1.2.0" >> $LFSLOG_PROCESS

time { bash b10.13.24.41.pyproject_hooks-1.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.42.build-1.2.2.post1"
echo "b10.13.24.42.build-1.2.2.post1" >> $LFSLOG_PROCESS

time { bash b10.13.24.42.build-1.2.2.post1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.15.04.Net-tools-2.10"
echo "b10.15.04.Net-tools-2.10" >> $LFSLOG_PROCESS

time { bash b10.15.04.Net-tools-2.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.51.liblinear-248"
echo "b10.09.51.liblinear-248" >> $LFSLOG_PROCESS

time { bash b10.09.51.liblinear-248.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.11.libnl-3.11.0"
echo "b10.17.11.libnl-3.11.0" >> $LFSLOG_PROCESS

time { bash b10.17.11.libnl-3.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.14.libpcap-1.10.5"
echo "b10.17.14.libpcap-1.10.5" >> $LFSLOG_PROCESS

time { bash b10.17.14.libpcap-1.10.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.16.05.Nmap-7.95"
echo "b10.16.05.Nmap-7.95" >> $LFSLOG_PROCESS

time { bash b10.16.05.Nmap-7.95.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
