#!/bin/bash

set -e
set -o pipefail

cd "`dirname $0`"
cd ../..

cp -r ./contrib/adminer/index.php ./www
cp -r ./contrib/adminer/plugins ./www
wget https://www.adminer.org/static/download/4.7.0/adminer-4.7.0.php -O ./www/adminer.php
wget https://raw.githubusercontent.com/vrana/adminer/master/plugins/plugin.php -O ./www/plugins/plugin.php
