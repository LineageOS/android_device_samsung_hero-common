#!/bin/bash

set -e
export DEVICE=hero-common
export VENDOR=samsung

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' common-proprietary-files.txt`; do
  echo "Extracting /system/$FILE ..."
  OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
  FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
  DEST=${PARSING_ARRAY[1]}
  if [ -z $DEST ]
  then
    DEST=$FILE
  fi
  DIR=`dirname $DEST`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  if [ "$SRC" = "adb" ]; then
    # if file does not exist try destination
    adb pull /system/$FILE $BASE/$DEST || adb pull /system/$DEST $BASE/$DEST
  else
    # if file does not exist try destination
    cp $SRC/system/$FILE $BASE/$DEST || cp $SRC/system/$DEST $BASE/$DEST
  fi
done

./setup-makefiles.sh
