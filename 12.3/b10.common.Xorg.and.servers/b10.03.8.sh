# b10.03.8.sh
#
# Common with OpenStack
# Python Modules
# after Pytest
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.13.24.13.Mako-1.3.9"
echo "b10.13.24.13.Mako-1.3.9" >> $LFSLOG_PROCESS

time { bash b10.13.24.13.Mako-1.3.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# echo "b10.13.24.04.Cython-3.0.12"
# echo "b10.13.24.04.Cython-3.0.12" >> $LFSLOG_PROCESS

# time { bash b10.13.24.04.Cython-3.0.12.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

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

#####

unset LFSLOG_PROCESS
