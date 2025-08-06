# BLfS-scripts
# Continuation of LfS-Scripts
#
# Author: Sevilla, Larry
#  eMail: sevilla.larry.prg@gmail.com
#
#
# based on: https://www.linuxfromscratch.org/blfs/
#
# BLfS version: 12.3
# Started: 2025/March/29
# arch: x64, UEFI (same with LfS-Scripts)
# Status: current
#
# about Python
#	LfS 12.3 uses Python 3.13.x
#		but will use Python 3.12.x due to OpenStack 2025.1 Epoxy
#
# a: LfS			- working
#
# c11: MariaDB		- working
# c12: PostgreSQL	- working
# c13: Apache		- working
# c14: ProFTPD		- working
#
# d20: Xorg			- working
#
# e23: Xfce	with LightDM	- working
#
# g42: Xfce Apps    - 
#

#
#
# Groupings
#
# Group a - LfS base
#
#
# Group b - Common apps & Libraries
#
#       b10 - Common to XOrg & servers, including OpenStack
#
#		b30 - OpenStack support
#
# Group c - Servers
#
#       c11 - MariaDB
#       c12 - PostgreSQL
#       c13 - Apache
#       c14 - ProFTPD
#
#       c19 - QEmu/KVM			- pending
# 
#
# Group d - XOrg & Xwayland
#
#		d10 - Xorg & Xwayland Support
#
#		d20	- Xorg & Xwayland
#
#
# Group e - Desktop Environment
#
#   ??? e00	- Common to DE's & DMs
#
#		e10 - Common to all DE's
#
#		e11 - Common to Xfce & Gnome
#	  	e12 - Common to LXQt & KDE
#
#	??? e13 - Common to Gnome & LXQt
#	???	e14 - Common to Xfce, Gnome & KDE
#	???	e15 - Common to Gnome, LXQt & KDE
#	???	e16 - Common to Gnome & KDE
#
#		e21	- Xfce support
#		e23 - Xfce Desktop
#		e24 - Xfce Applications
#
#		e31	- LXQt support
#		e32 - KF6, Plasma, & Misc Dependecies
#		e33	- LXQt Desktop Components
#		e34 - LXQt Applications
#
#		e41	- Gnome support
#		e42	- Gnome Libraries
#		e43	- Gnome Desktop Components
#		e44 - Gnome Applications
#
#   ?	e51	- KDE support
#		e52 - KDE Preliminaries
#	?	e53 - KDE Frameworks 6
#	?	e54	- KDE Frameworks 6 Based Applications
#	?	e55 - KDE Plasma
#
#	???	e61 - LXDE Support
#	???	e63 - LXDE Desktop	???	from 12.0	???
#	???	e64 - LXDE Applications
#
#
# Group f - Display Manager
#
#   ???	f0	- Common to DM's
#		f1	- GDM
#		f2	- LightDM			compiled in e23.Xfce.Desktop
#   	f3	- SDDM
#   ???	f4	- LXDM			??? (from 11.3)	???
#
#
# Group g - Xorg Applications
#
#		g11 - Common Xorg Applications support
#	?	g12 - Common Xorg Applications
#	?	g13 - Common Xorg Applications Others / External
#
#	?	g21 - Common Xfce / Gnome Applications support
#		g22 - Common Xfce / Gnome Applications						Evince, Firefox, LibreOffice
#	?	g23 - Common Xfce / Gnome Applications Others / External
#
#	?	g31 - Common LXQt / KDE Applications support
#	?	g32 - Common LXQt / KDE Applications
#	?	g33 - Common LXQt / KDE Applications Other / External
#
#	?	g41 - Xfce Applications support
#		g42 - Xfce Applications	Additional					        Mousepad, archiver
#	?	g43 - Xfce Applications Others / External
#
#	?	g51 - LXQt Applications support
#	?	g52 - LXQt Applications Additional
#	?	g53 - LXQt Applications Others / External
#
#	?	g61 - Gnome Applications support
#	?	g62 - Gnome Applications Additional
#	?	g63 - Gnome Applications Others / External
#
#	?	g71 - KDE Applications support
#	?	g72 - KDE Applications Additional
#	?	g73 - KDE Applications Others / External
#



#
# BLfS version: 12.2
# Started: 2024/Sept/04
# arch: x64, UEFI (same with LfS-Scripts)
# Status: working
#
# Note: on Firefox app, select the Python version installed during LfS creation:
#
#       Python 3.11.x is tested on OpenStack 2024.2
#       Python 3.11.10 is used/installed
#
#       Python 3.12.8 is errata update on LfS ver 12.2
#
#       Python 3.13.x is alternative upgrade
#
# some updates based on sequence/dependencies by:
#		https://www.linuxfromscratch.org/glfs/
#		https://glfs-book.github.io/glfs/
#	but exclude Steam & Wine
# 
# a: LfS			- working
# 
# c11: MariaDB		- working
# c12: PostgreSQL	- working
# c13: Apache		- working
# c14: ProFTPD		- working
#
# d20: Xorg			- working
#
# e23: Xfce	with LightDM	- working
#
# g63: Xfce Apps    - working but some issues
#                   ( some problem with Adwaita theme / no themes )
#



# BLfS version: 12.1
# Started: 2024/Mar/27
# arch: x64, UEFI (same with LfS-Scripts)
# Status: Stopped, NOT working, busy
#
# Stopped BLfS version: 12.0
# Started: 2023/Sept/08
# arch: x64, UEFI
# Stopped: 2024/Feb



# BLfS ver: 11.3
# Started: 2023/Apr/15
# arch: x64, UEFI
# Stopped: before 2023/Sept
#
# Group a - LfS / status: OK, working
# Group b - XOrg only / status: root ok, user ok
#
# Group c - Xfce only / status: failed on VM
# Group c - LXDE only / 2023/Aug/13 22:00 NOT fully tested due to time constraints
# abandoned due to new version 12.0 released 2023/Sept/01
