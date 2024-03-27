# d.10.00-1.lxdm.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "10.06.FriBidi-1.0.13"
echo "10.06.FriBidi-1.0.13" >> $LFSLOG_PROCESS

time { bash c.10.06.FriBidi-1.0.13.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.18.libjpeg-turbo-3.0.0"
echo "10.18.libjpeg-turbo-3.0.0" >> $LFSLOG_PROCESS

time { bash c.10.18.libjpeg-turbo-3.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
