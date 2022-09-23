#!/bin/bash

set -x
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TOOLCHAIN=$DIR/../toolchain/bin

if [ -d "$TOOLCHAIN" ] && [[ ":$PATH:" != *":$TOOLCHAIN:"* ]]; then
	echo "Adding toolchain to path"
	export PATH=$TOOLCHAIN:$PATH
fi

echo $TOOLCHAIN
echo $PATH

TCV=$(arm-none-eabi-gcc --version)

if [[ $TCV == *"7.3.1"* ]]; then
	echo "Toolchain version is correct"
else
	echo "Found toolchain version $TCV"
	echo "Toolchain version is incorrect"
	echo "Please install the correct version of the toolchain"
	echo "./script/setup.sh"
	exit 1
fi

make upload