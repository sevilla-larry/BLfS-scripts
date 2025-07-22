# e33.37.40.LXQt.Desktop.Final.Instructions.sh
#

#
# Dependencies Required:
#
#               e31.27.03 openbox-3.6.1
#
# Dependencies Recommended:
#
#               e31.28.02 breeze-icons-6.11.0
#               d10.11.04 desktop-file-utils-0.28
#
# Optional:
#
#               f3.26.03.sddm-0.21.0
#

export PKGLOG_DIR=$LFSLOG/37.40
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Final Configuration ..." >> $LFSLOG_PROCESS

ldconfig    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
update-mime-database /usr/share/mime    \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
xdg-icon-resource forceupdate           \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
update-desktop-database                 \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
