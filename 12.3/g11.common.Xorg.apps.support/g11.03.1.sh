# g11.03.1.sh
#
# Mousepad support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.09.06.Aspell-0.60.8.1"
echo "g11.09.06.Aspell-0.60.8.1" >> $LFSLOG_PROCESS

time { bash g11.09.06.Aspell-0.60.8.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.09.13.enchant-2.8.2"
echo "g11.09.13.enchant-2.8.2" >> $LFSLOG_PROCESS

time { bash g11.09.13.enchant-2.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
