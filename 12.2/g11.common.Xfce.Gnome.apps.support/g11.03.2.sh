# g11.03.2.sh
#
# Evince support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.25.33.libhandy-1.8.3"
echo "g11.25.33.libhandy-1.8.3" >> $LFSLOG_PROCESS

time { bash g11.25.33.libhandy-1.8.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
