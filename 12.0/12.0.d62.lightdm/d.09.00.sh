# d.09.00.sh
#
# General Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

# compile ahead needed by libgcrypt
#
echo "09.37.libgpg-error-1.47"
echo "09.37.libgpg-error-1.47" >> $LFSLOG_PROCESS

time { bash d.09.37.libgpg-error-1.47.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "09.36.libgcrypt-1.10.2"
echo "09.36.libgcrypt-1.10.2" >> $LFSLOG_PROCESS

time { bash d.09.36.libgcrypt-1.10.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
