# e21.03.Group02.sh
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

echo "e21.09.71.libxkbcommon-1.7.0"
echo "e21.09.71.libxkbcommon-1.7.0" >> $LFSLOG_PROCESS

time { bash e21.09.71.libxkbcommon-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
echo "e21.10.06.FriBidi-1.0.15"
echo "e21.10.06.FriBidi-1.0.15" >> $LFSLOG_PROCESS

time { bash e21.10.06.FriBidi-1.0.15.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e21.10.18.libjpeg-turbo-3.0.1"
echo "e21.10.18.libjpeg-turbo-3.0.1" >> $LFSLOG_PROCESS

time { bash e21.10.18.libjpeg-turbo-3.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
