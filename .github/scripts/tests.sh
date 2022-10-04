#!/bin/bash

ARCH=""
    
if [ $1 = "arm" ]
then
    ARCH="arm64"
else
    ARCH="x86_64"
fi

echo "Building with arch: ${ARCH}"

export LC_CTYPE=en_US.UTF-8

set -o pipefail && arch -"${ARCH}" xcodebuild  \
           -scheme CodeEditTextView \
           -derivedDataPath "~/Library/Developer/Xcode/DerivedData/" \
           -skipPackageUpdates \
           -disableAutomaticPackageResolution \
           -destination "platform=macos,arch=${ARCH}" \
           test