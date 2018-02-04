#!/bin/bash
set -xe
DATA="/etc/docker/compose/pandacoind/data"
pushd $DATA
ls -1 blk[0-9]*.dat | sort | xargs cat > bootstrap.dat
popd
rm bootstrap*
mv $DATA/bootstrap.dat .
zip bootstrap.zip bootstrap.dat
git commit -am "Autobootstrap: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin master
