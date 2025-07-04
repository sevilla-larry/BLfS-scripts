# e41.03.1.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e41.09.40.libdaemon-0.14"
echo "e41.09.40.libdaemon-0.14" >> $LFSLOG_PROCESS

time { bash e41.09.40.libdaemon-0.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e41.16.01.Avahi-0.8"
echo "e41.16.01.Avahi-0.8" >> $LFSLOG_PROCESS

time { bash e41.16.01.Avahi-0.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
