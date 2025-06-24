# g11.03.3.sh
#
# LibreOffice support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g11.13.19.01.Archive.Zip-1.68"
echo "g11.13.19.01.Archive.Zip-1.68" >> $LFSLOG_PROCESS

time { bash g11.13.19.01.Archive.Zip-1.68.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.09.09.CLucene-2.3.3.4"
echo "g11.09.09.CLucene-2.3.3.4" >> $LFSLOG_PROCESS

time { bash g11.09.09.CLucene-2.3.3.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.10.10.GLM-1.0.1"
echo "g11.10.10.GLM-1.0.1" >> $LFSLOG_PROCESS

time { bash g11.10.10.GLM-1.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.09.35.libatomic_ops-7.8.2"
echo "g11.09.35.libatomic_ops-7.8.2" >> $LFSLOG_PROCESS

time { bash g11.09.35.libatomic_ops-7.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.12.28.Raptor-2.0.16"
echo "g11.12.28.Raptor-2.0.16" >> $LFSLOG_PROCESS

time { bash g11.12.28.Raptor-2.0.16.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.12.29.Rasqal-0.9.33"
echo "g11.12.29.Rasqal-0.9.33" >> $LFSLOG_PROCESS

time { bash g11.12.29.Rasqal-0.9.33.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "g11.12.30.Redland-1.0.17"
echo "g11.12.30.Redland-1.0.17" >> $LFSLOG_PROCESS

time { bash g11.12.30.Redland-1.0.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
