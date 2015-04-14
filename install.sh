#!/bin/bash
MAGENTO_VERSION="1.9.0.1"
MAGENTO_DB_USER="root"
MAGENTO_DB_HOST="localhost"
MAGENTO_DB_NAME="magento"
MAGENTO_DB_PASS=""

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
#mysql -u${MAGENTO_DB_USER} ${MYSQLPASS} -h${MAGENTO_DB_HOST} -e "DROP DATABASE IF EXISTS ${MAGENTO_DB_NAME}; CREATE DATABASE ${MAGENTO_DB_NAME};"
sed -i -e s/MAGENTO_DB_HOST/${MAGENTO_DB_HOST}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_PORT/${MAGENTO_DB_PORT}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_USER/${MAGENTO_DB_USER}/g ./resources/local.xml.phpunit
sed -i -e s/MAGENTO_DB_PASS/${MAGENTO_DB_PASS}/g ./resources/local.xml.phpunit

echo "recreating test DB"
#mysql -u${MAGENTO_DB_USER} ${MYSQLPASS} -h${MAGENTO_DB_HOST} -e "DROP DATABASE IF EXISTS ${MAGENTO_DB_NAME}_test; CREATE DATABASE ${MAGENTO_DB_NAME}_test;"
sed -i -e s/MAGENTO_DB_NAME/${MAGENTO_DB_NAME}_test/g ./resources/local.xml.phpunit
echo "installing magento"
php resources/n98-magerun.phar install \
      --dbHost="${MAGENTO_DB_HOST}" --dbUser="${MAGENTO_DB_USER}" --dbPass="${MAGENTO_DB_PASS}" --dbName="${MAGENTO_DB_NAME}" \
      --installSampleData=yes \
      --useDefaultConfigParams=yes \
      --magentoVersionByName="${MAGENTO_VERSION}" \
      --installationFolder="${SOURCE_DIR}/public" \
      --baseUrl="http://magento.local/" || { echo "Installing Magento failed"; exit 1; }
echo "installing composer"
composer self-update
composer install
resources/n98-magerun.phar --root-dir=public config:set dev/template/allow_symlink 1