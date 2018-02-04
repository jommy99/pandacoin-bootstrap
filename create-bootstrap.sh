#!/bin/bash
set -xe
DATA="/etc/docker/compose/pandacoind/data"
ls -1 $DATA/blk[0-9]*.dat | sort | xargs cat > bootstrap.dat
rm bootstrap.zip
zip bootstrap.zip bootstrap.dat
git commit -am "Autobootstrap: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin master
