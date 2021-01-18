#!/bin/sh

VERSION=gcc-arm-none-eabi-7-2018-q2-update
case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X. Installing.'
     pushd toolchain
     wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/${VERSION}-mac.tar.bz2
     xattr -d com.apple.quarantine ${VERSION}-mac.tar.bz2
     tar xjf ${VERSION}-mac.tar.bz2
     rm ${VERSION}-mac.tar.bz2
     mv ${VERSION}/* .
     rm -r ${VERSION}
     popd
     echo 'Done, now add the toolchain to your path:'
     echo '  export PATH=$(pwd)/toolchain/bin:${PATH}'
     ;;

   Linux)
     echo 'Linux is not yet supported by this script. Please edit this file to add an installer.'
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows is not yet supported by this script. Please edit this file to add an installer.'
     ;;

   *)
     echo 'Unknown OS is not yet supported by this script. Please edit this file to add an installer.'
     ;;
esac
