# e21.03.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

### withOut GTK-4.*

echo "e21.33.07.VTE-0.78.4"
echo "e21.33.07.VTE-0.78.4" >> $LFSLOG_PROCESS

time { bash e21.33.07.VTE-0.78.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
