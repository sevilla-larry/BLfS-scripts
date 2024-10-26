# d10.03.03.sh
#
# libxslt
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.43.libgpg-error-1.50"
echo "d10.09.43.libgpg-error-1.50" >> $LFSLOG_PROCESS

time { bash d10.09.43.libgpg-error-1.50.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.42.libgcrypt-1.11.0"
echo "d10.09.42.libgcrypt-1.11.0" >> $LFSLOG_PROCESS

time { bash d10.09.42.libgcrypt-1.11.0.sh ; }

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

###

echo "d10.49.01.docbook-xml-4.5"
echo "d10.49.01.docbook-xml-4.5" >> $LFSLOG_PROCESS

time { bash d10.49.01.docbook-xml-4.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.49.04.docbook-xsl-nons-1.79.2"
echo "d10.49.04.docbook-xsl-nons-1.79.2" >> $LFSLOG_PROCESS

time { bash d10.49.04.docbook-xsl-nons-1.79.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
