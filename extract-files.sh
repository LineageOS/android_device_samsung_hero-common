#!/bin/bash
# Copyright (C) 2017 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

set -e

DEVICE=hero-common
VENDOR=samsung

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/cm/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
source "$HELPER"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

while [ "$1" != "" ]; do
    case $1 in
        -p | --path )           shift
                                SRC=$1
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                CLEAN_VENDOR=false
                                ;;
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -i | --slsi )           shift
                                SRC_SLSI=$1
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

if [ -z "$SRC_SLSI" ]; then
    SRC_SLSI=$SRC
fi

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/common-proprietary-files.txt "$SRC" "$SECTION"

"$MY_DIR"/setup-makefiles.sh
