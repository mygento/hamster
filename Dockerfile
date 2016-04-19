FROM mygento/php:{PHP_VERSION}

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

RUN mkdir -p /opt/magento && \
    wget --no-check-certificate -O /opt/{MAGE_VERSION}.zip https://github.com/bragento/magento-core/archive/{MAGE_VERSION}.zip && \
    unzip -q /opt/{MAGE_VERSION}.zip -d /opt/magento && \
    mv /opt/magento/magento-core-{MAGE_VERSION}/* /opt/magento/magento-core-{MAGE_VERSION}/.htaccess /opt/magento && \
    rm /opt/{MAGE_VERSION}.zip && \
    rm -fR /opt/magento/magento-core-{MAGE_VERSION}
