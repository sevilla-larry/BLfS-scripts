# b.03.90.all.support.apps.sh
#
# Support Applications
#

# libtirpc
bash b.17.00.sh

# Linux PAM & re-Install Shadow
bash b.04.00.sh

# # dbus
# bash b.12.00.Part1.sh

# "make install-dbus" from blfs-bootscripts
# then reboot

# libxml2
bash b.09.00.sh

# deferred
#
# # libevent
# bash c.17.00.sh