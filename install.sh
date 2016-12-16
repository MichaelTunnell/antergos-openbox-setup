#!/usr/bin/bash
# -*- coding: utf-8 -*-
#
#  install.sh
#
#  Copyright © 2013-2016 Antergos
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

_ANT_USERNAME="${1}"
_ANT_NO_OVERWRITE="${2}"

if [[ -z "${_ANT_USERNAME}" ]]; then
	echo "Usage:"
	echo "./install.sh username"
	exit 0
fi

# All necessary files are in /usr/share/antergos-openbox-setup
_ANT_SRC_DIR='/usr/share/antergos-openbox-setup'

if [[ -z "${_ANT_NO_OVERWRITE}" ]]; then
	echo "Applying Antergos Openbox configuration for default, root, and the following user: ${_ANT_USERNAME}."
	_ANT_DST_DIR="/home/${_ANT_USERNAME}"
else
	echo "Applying Antergos Openbox configuration for default and root. Skipping the following user: ${_ANT_USERNAME}."
fi

# Copy config files for root and skel
cp -R "${_ANT_SRC_DIR}/home/user" "${_ANT_TMP_DIR}/root"
cp -R "${_ANT_SRC_DIR}/home/user" "${_ANT_TMP_DIR}/etc/skel"

if [[ -n "${_ANT_DST_DIR}" ]]; then
	# Copy home files to user's folder
	cp -R "${_ANT_SRC_DIR}/home/user" "${_ANT_DST_DIR}"
fi

# Copy global files (/etc /usr)
cp -R "${_ANT_SRC_DIR}/etc" /etc
cp -R "${_ANT_SRC_DIR}/usr" /usr

if [[ -n "${_ANT_DST_DIR}" ]]; then
	# Fix permissions
	chown -R "${_ANT_USERNAME}:users" "${_ANT_DST_DIR}"
fi

# Apply gsettings
glib-compile-schemas /usr/share/glib-2.0/schemas
