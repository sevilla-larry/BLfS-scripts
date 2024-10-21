# e21.03.Group01.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e21.09.45.libgudev-238"
echo "e21.09.45.libgudev-238" >> $LFSLOG_PROCESS

time { bash e21.09.45.libgudev-238.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.25.03.at-spi2-core-2.52.0"
echo "e21.25.03.at-spi2-core-2.52.0" >> $LFSLOG_PROCESS

time { bash e21.25.03.at-spi2-core-2.52.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
