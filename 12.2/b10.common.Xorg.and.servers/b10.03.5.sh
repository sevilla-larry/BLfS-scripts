# b10.03.5.sh
#
# libgcrypt & libgpg-error
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.09.43.libgpg-error-1.50"
echo "b10.09.43.libgpg-error-1.50" >> $LFSLOG_PROCESS

time { bash b10.09.43.libgpg-error-1.50.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.42.libgcrypt-1.11.0"
echo "b10.09.42.libgcrypt-1.11.0" >> $LFSLOG_PROCESS

time { bash b10.09.42.libgcrypt-1.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
