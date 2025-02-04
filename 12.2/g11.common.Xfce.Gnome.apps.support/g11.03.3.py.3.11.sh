# g11.03.3.py.3.11.sh
#
# Recompile Python after SQLite
# called from OpenStack
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.21.Python-3.11.10"
echo "g11.13.21.Python-3.11.10" >> $LFSLOG_PROCESS

time { bash g11.13.21.Python-3.11.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
