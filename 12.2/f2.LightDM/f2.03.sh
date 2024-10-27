# f2.03.Group01.sh
#
# LightDM support
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "f2.25.37.libxklavier-5.4"
echo "f2.25.37.libxklavier-5.4" >> $LFSLOG_PROCESS

time { bash f2.25.37.libxklavier-5.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "f2.49.05.itstool-2.0.7"
echo "f2.49.05.itstool-2.0.7" >> $LFSLOG_PROCESS

time { bash f2.49.05.itstool-2.0.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "f2.26.02.lightdm-1.32.0"
echo "f2.26.02.lightdm-1.32.0" >> $LFSLOG_PROCESS

time { bash f2.26.02.lightdm-1.32.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
