#!/bin/bash
SDK_ZIP=FitSDKRelease_20.66.00.zip
SDK_DIR=FitSDKRelease_20.66.00
mkdir -p downloads
curl https://www.thisisant.com/assets/resources/FIT/$SDK_ZIP --output downloads/$SDK_ZIP
unzip downloads/$SDK_ZIP -d downloads
shopt -s dotglob && cp -a downloads/$SDK_DIR/* .
rm -rf downloads/$SDK_DIR
