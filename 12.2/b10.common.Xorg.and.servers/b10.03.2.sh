# b10.03.2.sh
#
# Dependencies of
#   PostgreSQL
#		and
#	RabbitMQ
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

#
# needs
# b10.03.5.sh
#   libgcrypt
#   libgpg-error
#

###

echo "b10.09.74.libxslt-1.1.42"
echo "b10.09.74.libxslt-1.1.42" >> $LFSLOG_PROCESS

time { bash b10.09.74.libxslt-1.1.42.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.49.01.docbook-xml-4.5"
echo "b10.49.01.docbook-xml-4.5" >> $LFSLOG_PROCESS

time { bash b10.49.01.docbook-xml-4.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.49.04.docbook-xsl-nons-1.79.2"
echo "b10.49.04.docbook-xsl-nons-1.79.2" >> $LFSLOG_PROCESS

time { bash b10.49.04.docbook-xsl-nons-1.79.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.49.06.xmlto-0.0.29"
echo "b10.49.06.xmlto-0.0.29" >> $LFSLOG_PROCESS

time { bash b10.49.06.xmlto-0.0.29.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
