# b10.03.5.sh
#
# Common with Apache (OpenStack) and Xorg
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.13.14.Lua-5.4.8"
echo "b10.13.14.Lua-5.4.8" >> $LFSLOG_PROCESS

time { bash b10.13.14.Lua-5.4.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
