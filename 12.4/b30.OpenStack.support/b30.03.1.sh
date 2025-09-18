# b30.03.1.sh
#
# OpenStack Support Apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b30.11.12.lsof-4.99.0"
echo "b30.11.12.lsof-4.99.0" >> $LFSLOG_PROCESS

time { bash b30.11.12.lsof-4.99.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b30.04.09.iptables-1.8.11"
echo "b30.04.09.iptables-1.8.11" >> $LFSLOG_PROCESS

time { bash b30.04.09.iptables-1.8.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
