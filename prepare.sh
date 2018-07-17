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

#
# change to directory where script lives in case called from elsewhere
#
cd $DIR

#
# Choose SDK Version
#
SDK=FitSDKRelease_20.66.00

#
# Download and extract the sources
#
DOWNLOAD_DIR=downloads
SDK_ZIP=$SDK.zip
SDK_URL=https://www.thisisant.com/assets/resources/FIT/$SDK_ZIP
DOWNLOADED_ZIP=$DOWNLOAD_DIR/$SDK_ZIP
EXTRACTED_CONTENTS=$DOWNLOAD_DIR/$SDK
mkdir -p $DOWNLOAD_DIR
if [ ! -f $DOWNLOADED_ZIP ]; then
    curl $SDK_URL --output $DOWNLOADED_ZIP
fi
unzip $DOWNLOADED_ZIP -d $DOWNLOAD_DIR
shopt -s dotglob && cp -a $EXTRACTED_CONTENTS/* .
rm -rf $EXTRACTED_CONTENTS
