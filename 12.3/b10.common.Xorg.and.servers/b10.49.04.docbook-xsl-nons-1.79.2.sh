# d10.49.04.docbook-xsl-nons-1.79.2.sh
#

#
# Dependencies Recommended:
#
#               b10.09.72 libxml2-2.13.6
#
# Dependencies Optional:
#
#               b10.09.74 libxslt-1.1.42
#

#
# Recommended (at runtime) by:
#
#               b10.09.74 libxslt-1.1.42
#

export PKG="docbook-xsl-nons-1.79.2"
export PKGLOG_DIR=$LFSLOG/49.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../docbook-xsl-nons-1.79.2-stack_fix-1.patch  \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Extract doc tar..."
echo "2. Extract doc tar..." >> $LFSLOG_PROCESS
echo "2. Extract doc tar..." >> $PKGLOG_ERROR
tar -xvf    ../docbook-xsl-doc-1.79.2.tar.bz2   \
            --strip-components=1                \
            >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "3. Install ..."
echo "3. Install ..." >> $LFSLOG_PROCESS
echo "3. Install ..." >> $PKGLOG_ERROR
install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2      \
         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v -R VERSION assembly common eclipse epub epub3 extensions fo           \
         highlighting html htmlhelp images javahelp lib manpages params     \
         profiling roundtrip slides template tests tools webhelp website    \
         xhtml xhtml-1_1 xhtml5                                             \
        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2                 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -vs VERSION /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2/VERSION.xsl   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m644 -D README \
                    /usr/share/doc/docbook-xsl-nons-1.79.2/README.txt       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644    RELEASE-NOTES* NEWS* \
                    /usr/share/doc/docbook-xsl-nons-1.79.2                  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v -R doc/* /usr/share/doc/docbook-xsl-nons-1.79.2   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

if [ ! -d /etc/xml ]; then
    install -v -m755 -d /etc/xml    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR ;
fi

if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
fi

xmlcatalog --noout --add "rewriteSystem" \
           "http://cdn.docbook.org/release/xsl-nons/1.79.2" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteSystem" \
           "https://cdn.docbook.org/release/xsl-nons/1.79.2" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteURI" \
           "http://cdn.docbook.org/release/xsl-nons/1.79.2" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteURI" \
           "https://cdn.docbook.org/release/xsl-nons/1.79.2" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteSystem" \
           "http://cdn.docbook.org/release/xsl-nons/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteSystem" \
           "https://cdn.docbook.org/release/xsl-nons/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteURI" \
           "http://cdn.docbook.org/release/xsl-nons/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteURI" \
           "https://cdn.docbook.org/release/xsl-nons/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
    /etc/xml/catalog


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
