#!/bin/bash
tmpdir="/tmp/powerline"
[ ! -z $TMPDIR ] && tmpdir=$TMPDIR
[ ! -d $tmpdir ] && mkdir -p $tmpdir

cd $tmpdir
git clone https://github.com/powerline/fonts.git
cd fonts
source ./install.sh
cd ../..
rm -rf $tmpdir
echo "Please also update your font to powerline type in your terminal font setting"
