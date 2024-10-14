# f21.03.Group01.sh
#
# LightDM support
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "f21.11.11.ISO.Codes-4.16.0"
echo "f21.11.11.ISO.Codes-4.16.0" >> $LFSLOG_PROCESS

time { bash f21.11.11.ISO.Codes-4.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "f21.25.37.libxklavier-5.4"
echo "f21.25.37.libxklavier-5.4" >> $LFSLOG_PROCESS

time { bash f21.25.37.libxklavier-5.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "f21.49.05.itstool-2.0.7"
echo "f21.49.05.itstool-2.0.7" >> $LFSLOG_PROCESS

time { bash f21.49.05.itstool-2.0.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
