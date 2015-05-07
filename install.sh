#!/bin/bash

if [ -z $MAGENTO_DB_HOST ]; then MAGENTO_DB_HOST="localhost"; fi
if [ -z $MAGENTO_DB_PORT ]; then MAGENTO_DB_PORT="3306"; fi
if [ -z $MAGENTO_DB_USER ]; then MAGENTO_DB_USER="root"; fi
if [ -z $MAGENTO_DB_PASS ]; then MAGENTO_DB_PASS=""; fi
if [ -z $MAGENTO_DB_NAME ]; then MAGENTO_DB_NAME="magento"; fi
if [ -z $MAGENTO_DB_ALLOWSAME ]; then MAGENTO_DB_ALLOWSAME="1"; fi

# Get absolute path to main directory
ABSPATH=$(cd "${0%/*}" 2>/dev/null; echo "${PWD}/${0##*/}")
SOURCE_DIR=`dirname "${ABSPATH}"`
echo
echo "---------------------"
echo "-  Mygento Hamster  -"
echo "---------------------"
echo
echo "Installing ${MAGENTO_VERSION} in ${SOURCE_DIR}/public"
echo
echo "Host: ${MAGENTO_DB_HOST}"
echo "User: ${MAGENTO_DB_USER}"
echo "Pass: [eaten]"
echo "Main DB: ${MAGENTO_DB_NAME}"
echo "Test DB: ${MAGENTO_DB_NAME}_test"
echo
echo
cd ${SOURCE_DIR}
echo "recreating DB"
mysql -u${MAGENTO_DB_USER} ${MYSQLPASS} -h${MAGENTO_DB_HOST} -e "DROP DATABASE IF EXISTS ${MAGENTO_DB_NAME}; CREATE DATABASE ${MAGENTO_DB_NAME};"
sed -i -e s/MAGENTO_DB_HOST/${MAGENTO_DB_HOST}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_PORT/${MAGENTO_DB_PORT}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_USER/${MAGENTO_DB_USER}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_PASS/${MAGENTO_DB_PASS}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_NAME/${MAGENTO_DB_NAME}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_ALLOWSAME/${MAGENTO_DB_ALLOWSAME}/g ./resources/local.xml.phpunit
echo "installing magento"
php resources/n98-magerun.phar self-update
php resources/n98-magerun.phar install \
      --dbHost="${MAGENTO_DB_HOST}" --dbUser="${MAGENTO_DB_USER}" --dbPass="${MAGENTO_DB_PASS}" --dbName="${MAGENTO_DB_NAME}" \
      --installSampleData=no \
      --useDefaultConfigParams=yes \
      --magentoVersionByName="${MAGENTO_VERSION}" \
      --installationFolder="${SOURCE_DIR}/public" \
      --baseUrl="http://magento.local/" || { echo "Installing Magento failed"; exit 1; }
echo "installing composer"
composer self-update
composer install --no-interaction
cd vendor/ecomdev/ecomdev_phpunit
git submodule update --init
cd "${SOURCE_DIR}"
php resources/n98-magerun.phar --root-dir=public config:set dev/template/allow_symlink 1