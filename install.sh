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

_ANT_USERNAME="${1}"
_ANT_NO_OVERWRITE="${2}"

if [[ -z "${_ANT_USERNAME}" ]]; then
	echo "Usage:"
	echo "./install.sh username"
	exit 0
fi

# All necessary files are in /DESTDIR/usr/share/antergos-openbox-setup
_ANT_SRCDIR='/usr/share/antergos-openbox-setup'
_ANT_TMP_DIR='/tmp/.antergos-openbox-setup'

if [[ -z "${_ANT_NO_OVERWRITE}" ]]; then
	echo "Applying Antergos Openbox configuration for default, root, and the following user: ${_ANT_USERNAME}."
	_ANT_DSTDIR="/home/${_ANT_USERNAME}"
else
	echo "Applying Antergos Openbox configuration for default and root. Skipping the following user: ${_ANT_USERNAME}."
fi

# Make a temp copy of files
mkdir "${_ANT_TMP_DIR}"
cp -R -t "${_ANT_TMP_DIR}" "${_ANT_SRCDIR}/{etc,home,usr}"

# Create root and skel directories
mkdir "${_ANT_TMP_DIR}/root"
mkdir "${_ANT_TMP_DIR}/etc/skel"

# Copy config files for root and skel
cp -R "${_ANT_TMP_DIR}/home/<USERNAME>" "${_ANT_TMP_DIR}/root"
cp -R "${_ANT_TMP_DIR}/home/<USERNAME>" "${_ANT_TMP_DIR}/etc/skel"

if [[ -n "${_ANT_DSTDIR}" ]]; then
	# Rename user's home directory in our temp files
	mv "${_ANT_TMP_DIR}/home/<USERNAME>" "${_ANT_TMP_DIR}/home/${_ANT_USERNAME}"
else
	# Not overwriting so remove home directory from our temp files.
	rm -rf "${_ANT_TMP_DIR:?}/home"
fi

# Copy files
for _ANT_DIR in "${_ANT_TMP_DIR}"/*
do
	[[ -n "${_ANT_DIR}" ]] && [[ -d "${_ANT_DIR}" ]] && cp -R "${_ANT_DIR}" /
done

if [[ -n "${_ANT_DSTDIR}" ]]; then
	# Fix permissions
	chown -R "${USER_NAME}:users" "/home/${USER_NAME}"
fi
