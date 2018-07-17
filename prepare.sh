#!/bin/bash
#
# google docet - jump within the directory which contains this script
#

SOURCE="${BASH_SOURCE[0]}"

while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

#
# set aside the base dir for future references
#

DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
cd $DIR

DOWNLOAD_DIR=downloads
SDK=FitSDKRelease_20.66.00
SDK_ZIP=$SDK.zip
DOWNLOADED_ZIP=$DOWNLOAD_DIR/$SDK_ZIP
EXTRACTED_CONTENTS=$DOWNLOAD_DIR/$SDK
mkdir -p $DOWNLOAD_DIR
if [ ! -f $DOWNLOADED_ZIP ]; then
    curl https://www.thisisant.com/assets/resources/FIT/$SDK_ZIP --output $DOWNLOADED_ZIP
fi
unzip $DOWNLOADED_ZIP -d $DOWNLOAD_DIR
shopt -s dotglob && cp -a $EXTRACTED_CONTENTS/* .
rm -rf $EXTRACTED_CONTENTS
