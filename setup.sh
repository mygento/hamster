#!/bin/bash
set -e
set -x
mkdir "${TRAVIS_BUILD_DIR}/magento"
cd "${TRAVIS_BUILD_DIR}/magento"
git clone https://github.com/mygento/hamster.git "${TRAVIS_BUILD_DIR}/magento"
chmod +x ${TRAVIS_BUILD_DIR}/magento/install.sh
${TRAVIS_BUILD_DIR}/magento/install.sh
cp ${TRAVIS_BUILD_DIR}/magento/resources/local.xml.phpunit ${TRAVIS_BUILD_DIR}/magento/public/app/etc/
cp ${TRAVIS_BUILD_DIR}/magento/resources/phpunit.xml ${TRAVIS_BUILD_DIR}/magento/public/phpunit.xml
cd ${TRAVIS_BUILD_DIR}/magento/public
phpunit