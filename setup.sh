#!/bin/bash
set -e
set -x

git clone https://github.com/mygento/hamster.git "${TRAVIS_BUILD_DIR}"
chmod +x ${TRAVIS_BUILD_DIR}/install.sh
${TRAVIS_BUILD_DIR}/install.sh
cd ${TRAVIS_BUILD_DIR}/public
phpunit --colors -d display_errors=1