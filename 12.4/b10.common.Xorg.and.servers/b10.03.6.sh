# b10.03.5.sh
#
# Common with OpenStack
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.13.24.13.lxml-6.0.0"
echo "b10.13.24.13.lxml-6.0.0" >> $LFSLOG_PROCESS

time { bash b10.13.24.13.lxml-6.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.24.14.Mako-1.3.10"
echo "b10.13.24.14.Mako-1.3.10" >> $LFSLOG_PROCESS

time { bash b10.13.24.14.Mako-1.3.10.sh ; }

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

echo "b10.09.78.libyaml-0.2.5"
echo "b10.09.78.libyaml-0.2.5" >> $LFSLOG_PROCESS

time { bash b10.09.78.libyaml-0.2.5.sh ; }

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

echo "b10.09.52.liblinear-249"
echo "b10.09.52.liblinear-249" >> $LFSLOG_PROCESS

time { bash b10.09.52.liblinear-249.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#echo "b10.13.25.20.Pyproject_Hooks-1.2.0"
#echo "b10.13.25.20.Pyproject_Hooks-1.2.0" >> $LFSLOG_PROCESS

#time { bash b10.13.25.20.Pyproject_Hooks-1.2.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

#echo "b10.13.24.02.build-1.3.0"
#echo "b10.13.24.02.build-1.3.0" >> $LFSLOG_PROCESS

#time { bash b10.13.24.02.build-1.3.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

### to LfS

#echo "b10.17.11.libnl-3.11.0"
#echo "b10.17.11.libnl-3.11.0" >> $LFSLOG_PROCESS

#time { bash b10.17.11.libnl-3.11.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

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

echo "b10.16.05.Nmap-7.98"
echo "b10.16.05.Nmap-7.98" >> $LFSLOG_PROCESS

time { bash b10.16.05.Nmap-7.98.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
