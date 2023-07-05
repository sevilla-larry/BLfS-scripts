# b.25.00.sh
#
# Graphical Environment Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "25.37.Libdrm-2.4.115"
echo "25.37.Libdrm-2.4.115" >> $LFSLOG_PROCESS

time { bash b.25.37.Libdrm-2.4.115.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.66.libxml2-2.10.3"  ???????????????????????????????????????????
echo "09.66.libxml2-2.10.3" >> $LFSLOG_PROCESS

time { bash b.09.66.libxml2-2.10.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
