#!/usr/bin/bash

# -*- coding: utf-8 -*-
#
#  install.sh
#
#  Copyright © 2013-2015 Antergos
#
#  This file is part of Antergos.
#
#  Antergos is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  Antergos is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with Antergos; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

USER_NAME=$1

if [ "$USER_NAME" == "" ]; then
  echo "Usage:"
  echo "./install.sh username"
  exit 0
fi

echo "Setting Antergos Openbox setup to user $USER_NAME"

# All necessary files are in /DESTDIR/usr/share/antergos-openbox-setup
SRCDIR = /usr/share/antergos-openbox-setup
DSTDIR = /home/${USER_NAME}
CFGDIR = /home/${USER_NAME}/.config

# Copy files
cp ${SRCDIR}/gtkrc-2.0 ${DSTDIR}/.gtkrc-2.0
cp ${SRCDIR}/xinitrc ${DSTDIR}/.xinitrc

mkdir -p ${CFGDIR}
cp ${SRCDIR}/compton.conf ${CFGDIR}/compton.conf
cp ${SRCDIR}/conky.conf ${CFGDIR}/conky.conf

mkdir -p ${DSTDIR}/gtk-2.0
cp ${SRCDIR}/gtkfilechooser.ini ${DSTDIR}/gtk-2.0/gtkfilechooser.ini
cp ${SRCDIR}/gtkrc-2.0 ${DSTDIR}/.gtkrc-2.0

mkdir -p ${DSTDIR}/gtk-3.0
cp ${SRCDIR}/settings.ini ${DSTDIR}/gtk-3.0

mkdir -p ${CFGDIR}/nitrogen
cp ${SRCDIR}/nitrogen.cfg ${CFGDIR}/nitrogen/nitrogen.cfg
cp ${SRCDIR}/bg-saved.cfg ${CFGDIR}/nitrogen/bg-saved.cfg

mkdir -p /etc/oblogout
cp ${SRCDIR}/oblogout.conf /etc/oblogout.conf
cp ${SRCDIR}/oblogout/cancel.svg /etc/oblogout/cancel.svg
cp ${SRCDIR}/oblogout/lock.svg /etc/oblogout/lock.svg
cp ${SRCDIR}/oblogout/restart.svg /etc/oblogout/restart.svg
cp ${SRCDIR}/oblogout/suspend.svg /etc/oblogout/suspend.svg
cp ${SRCDIR}/oblogout/hibernate.svg /etc/oblogout/hibernate.svg
cp ${SRCDIR}/oblogout/logout.svg /etc/oblogout/logout.svg
cp ${SRCDIR}/oblogout/shutdown.svg /etc/oblogout/shutdown.svg
cp ${SRCDIR}/oblogout/switch.svg /etc/oblogout/switch.svg

mkdir -p ${CFGDIR}/openbox/pipemenus
cp ${SRCDIR}/openbox/autostart ${CFGDIR}/openbox/autostart
cp ${SRCDIR}/openbox/menu.xml ${CFGDIR}/openbox/menu.xml
cp ${SRCDIR}/openbox/rc.xml ${CFGDIR}/openbox/rc.xml
cp ${SRCDIR}/openbox/pipemenus/obpipemenu-places ${CFGDIR}/openbox/pipemenus/obpipemenu-places
cp ${SRCDIR}/openbox/pipemenus/obrecent.sh ${CFGDIR}/openbox/pipemenus/obrecent.sh

mkdir -p ${CFGDIR}/pcmanfm
cp ${SRCDIR}/pacmanfm.conf ${CFGDIR}/pcmanfm/pcmanfm.conf

mkdir -p ${CFGDIR}/libfm
cp ${SRCDIR}/libfm.conf ${CFGDIR}/libfm/libfm.conf

mkdir -p ${CFGDIR}/plank/dock1/launchers
cp ${SRCDIR}/plank/dock1/settings ${CFGDIR}/plank/dock1/settings
cp ${SRCDIR}/plank/dock1/launchers/chromium.dockitem ${CFGDIR}/plank/dock1/launchers/chromium.dockitem
cp ${SRCDIR}/plank/dock1/launchers/gpicview.dockitem ${CFGDIR}/plank/dock1/launchers/gpicview.dockitem
cp ${SRCDIR}/plank/dock1/launchers/mousepad.dockitem ${CFGDIR}/plank/dock1/launchers/mousepad.dockitem
cp ${SRCDIR}/plank/dock1/launchers/pragha.dockitem ${CFGDIR}/plank/dock1/launchers/pragha.dockitem
cp ${SRCDIR}/plank/dock1/launchers/gnome-mplayer.dockitem ${CFGDIR}/plank/dock1/launchers/gnome-mplayer.dockitem
cp ${SRCDIR}/plank/dock1/launchers/lxterminal.dockitem ${CFGDIR}/plank/dock1/launchers/lxterminal.dockitem
cp ${SRCDIR}/plank/dock1/launchers/plank.dockitem ${CFGDIR}/plank/dock1/launchers/plank.dockitem

mkdir -p ${CFGDIR}/tint2
cp ${SRCDIR}/tint2rc ${CFGDIR}/tint2/tint2rc

mkdir -p ${CFGDIR}/volumeicon
cp ${SRCDIR}/volumeicon ${CFGDIR}/volumeicon/volumeicon

chown -R ${USER_NAME}:users /home/${USER_NAME}
