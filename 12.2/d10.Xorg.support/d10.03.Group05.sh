# d10.03.Group05.sh
#
# duktape & libxslt
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.12.duktape-2.7.0"
echo "d10.09.12.duktape-2.7.0.sh" >> $LFSLOG_PROCESS

time { bash d10.09.12.duktape-2.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.74.libxslt-1.1.42"
echo "d10.09.74.libxslt-1.1.42" >> $LFSLOG_PROCESS

time { bash d10.09.74.libxslt-1.1.42.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
