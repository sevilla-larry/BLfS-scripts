# b10.03.0.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

# echo "b10.12.36.UnZip-6.0"
# echo "b10.12.36.UnZip-6.0" >> $LFSLOG_PROCESS

# time { bash b10.12.36.UnZip-6.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "b10.12.41.Zip-3.0"
echo "b10.12.41.Zip-3.0" >> $LFSLOG_PROCESS

time { bash b10.12.41.Zip-3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.25.icu-76.1"
echo "b10.09.25.icu-76.1" >> $LFSLOG_PROCESS

time { bash b10.09.25.icu-76.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.72.libxml2-2.13.6"
echo "b10.09.72.libxml2-2.13.6" >> $LFSLOG_PROCESS

time { bash b10.09.72.libxml2-2.13.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.83.PCRE2-10.45"
echo "b10.09.83.PCRE2-10.45" >> $LFSLOG_PROCESS

time { bash b10.09.83.PCRE2-10.45.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
