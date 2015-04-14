#!/bin/bash
set -e
set -x
mkdir "${TRAVIS_BUILD_DIR}/magento"
cd "${TRAVIS_BUILD_DIR}/magento"
git clone https://github.com/mygento/hamster.git "${TRAVIS_BUILD_DIR}/magento"
chmod +x ${TRAVIS_BUILD_DIR}/magento/install.sh
${TRAVIS_BUILD_DIR}/magento/install.sh
cd ${TRAVIS_BUILD_DIR}/magento/public
phpunit --colors -d display_errors=1