# b01.17.10.libnl-3.10.0.sh
#

#
# Optionally by:
#
#               b01.17.13 libpcap-1.10.4
#

#
# kernel config for test
#
# General setup --->
#   -*- Namespaces support --->                                       [NAMESPACES]
#     [*] User namespace                                                 [USER_NS]
#     [*] Network namespace                                               [NET_NS]
#
# [*] Networking support --->                                                [NET]
#   Networking options --->
#     [*]   TCP/IP networking                                               [INET]
#     [*]     IP: advanced router                             [IP_ADVANCED_ROUTER]
#     [*]       IP: policy routing                            [IP_MULTIPLE_TABLES]
#     <*/M>   IP: tunneling                                             [NET_IPIP]
#     <*/M>   IP: GRE demultiplexer                              [NET_IPGRE_DEMUX]
#     <*/M>   IP: GRE tunnels over IP                                  [NET_IPGRE]
#     <*/M>   Virtual (secure) IP: tunneling                           [NET_IPVTI]
#     <*>     The IPv6 protocol --->                                        [IPV6]
#       <*/M>   IPv6: IPv6-in-IPv4 tunnel (SIT driver)                  [IPV6_SIT]
#       <*/M>   IPv6: IP-in-IPv6 tunnel (RFC2473)                    [IPV6_TUNNEL]
#       [*]     IPv6: Multiple Routing Tables               [IPV6_MULTIPLE_TABLES]
#     [*]   Network packet filtering framework (Netfilter) --->        [NETFILTER]
#       Core Netfilter Configuration --->
#         <*/M> Netfilter nf_tables support                            [NF_TABLES]
#         [*]     Netfilter nf_tables netdev tables support     [NF_TABLES_NETDEV]
#         {*/M}   Netfilter packet duplication support             [NF_DUP_NETDEV]
#         <*/M>   Netfilter nf_tables netdev packet forwarding support
#                                                           ...  [NFT_FWD_NETDEV]
#     <*/M> 802.1d Ethernet Bridging                                      [BRIDGE]
#     <*/M> 802.1Q/802.1ad VLAN Support                               [VLAN_8021Q]
#     -*-   L3 Master device support                           [NET_L3_MASTER_DEV]

# Device Drivers --->
#   [*] Network device support --->                                   [NETDEVICES]
#     [*]   Network core driver support                                 [NET_CORE]
#     <*/M>   Bonding driver support                                     [BONDING]
#     <*/M>   Dummy net driver support                                     [DUMMY]
#     <*/M>   Intermediate Functional Block support                          [IFB]
#     <*/M>   MAC-VLAN support                                           [MACVLAN]
#     <*/M>     MAC-VLAN based tap driver                                [MACVTAP]
#     <*/M>   IP-VLAN support                                             [IPVLAN]
#     <*/M>   Virtual eXtensible Local Area Network (VXLAN)                [VXLAN]
#     <*/M>   IEEE 802.1AE MAC-level encryption (MACsec)                  [MACSEC]
#     <*/M>   Virtual ethernet pair device                                  [VETH]
#     <*/M>   Virtual Routing and Forwarding (Lite)                      [NET_VRF]
#

export PKG="libnl-3.10.0"
export PKGLOG_DIR=$LFSLOG/17.10
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            --disable-static    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -vp /usr/share/doc/libnl-3.10.0   \
    >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR
tar -xf ../libnl-doc-3.10.0.tar.gz --strip-components=1 --no-same-owner \
    -C  /usr/share/doc/libnl-3.10.0     \
    >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
