# e10.09.31.keyutils-1.6.3.sh
# Gnome (LXQt KDE)
#

#
# Recommended by:
#
#               e10.09.36 libblockdev-3.3.1
#

#
# Kernal configuration
#
# Security options --->
#   [*] Enable access key retention support                                 [KEYS]
#   [*]   Large payload keys                                            [BIG_KEYS]
#   [*]   Diffie-Hellman operations on retained keys           [KEY_DH_OPERATIONS]
#
# -*- Cryptographic API --->                                              [CRYPTO]
#   Public-key cryptography --->
#     <*/M> RSA (Rivest-Shamir-Adleman)                               [CRYPTO_RSA]
#   Hashes, digests, and MACs --->
#     <*/M> SHA-1                                                    [CRYPTO_SHA1]
#   [*] Asymmetric (public-key cryptographic) key type --->  [ASYMMETRIC_KEY_TYPE]
#     <*> Asymmetric public-key crypto algorithm subtype
#                                             ...  [ASYMMETRIC_PUBLIC_KEY_SUBTYPE]
#     # If not built into the kernel, [SYSTEM_TRUSTED_KEYRING] won't show up;
#     # building as a module won't work:
#     <*>   X.509 certificate parser                     [X509_CERTIFICATE_PARSER]
#   Certificates for signature checking --->
#     [*] Provide system-wide ring of trusted keys        [SYSTEM_TRUSTED_KEYRING]
#     [*]   Provide a keyring to which extra trustable keys may be added
#                                                 ...  [SECONDARY_TRUSTED_KEYRING]
#     [*] Provide system-wide ring of blacklisted keys  [SYSTEM_BLACKLIST_KEYRING]
#
# Library routines --->
#   Crypto library routines --->
#     # If not built into the kernel, [BIG_KEYS] won't show up;
#     # building as a module won't work:
#     <*> ChaCha20-Poly1305 AEAD support (8-byte nonce library version)
#                                               ...  [CRYPTO_LIB_CHACHA20POLY1305]
#

export PKG="keyutils-1.6.3"
export PKGLOG_DIR=$LFSLOG/09.31
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make					\
	NO_ARLIB=1			\
	LIBDIR=/usr/lib		\
	BINDIR=/usr/bin		\
	SBINDIR=/usr/sbin	\
		install			\
		> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make -k test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
