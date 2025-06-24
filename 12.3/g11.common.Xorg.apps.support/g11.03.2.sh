# g11.03.2.sh
#
# Firefox support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#    Node.js group
###

echo "g11.09.80.Node.js-22.14.0"
echo "g11.09.80.Node.js-22.14.0" >> $LFSLOG_PROCESS

time { bash g11.09.80.Node.js-22.14.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
