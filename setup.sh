#!/bin/bash
set -e
set -x

git clone https://github.com/mygento/hamster.git "${BUILDENV}"
chmod +x ${BUILDENV}/install.sh
${BUILDENV}/install.sh
cd ${BUILDENV}/public
${BUILDENV}/bin/phpunit --colors -d display_errors=1