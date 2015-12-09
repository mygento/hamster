FROM mygento/hamster

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

#COPY ./.magento-version /opt/.magento-version
#COPY ./.php-version /opt/.php-version
RUN phpenv versions
#RUN MAGENTO_VERSION_FULL=$(cat /opt/.magento-version) && \
#  MAGENTO_VERSION=`echo $MAGENTO_VERSION_FULL |  cut -f3 -d "-"` && \
#  echo $MAGENTO_VERSION && \
#  mkdir -p /var/www && \
#  git clone -b $MAGENTO_VERSION /opt/magento /var/www/magento
#RUN ls -la /opt
#RUN cp -R /opt/ecomdev-phpunit/app /var/www/magento && cp -R /opt/ecomdev-phpunit/lib /var/www/magento
#RUN ls -la /var/www/magento/app/code/community
#RUN PHP_VERSION=$(cat /opt/.php-version) && phpenv global $PHP_VERSION
#RUN php -v
#ADD ./start.sh /start.sh
#ADD ./resources/local.xml.phpunit /opt/local.xml.phpunit
#ADD ./resources/phpunit.xml /opt/phpunit.xml
#ADD ./resources/n98-magerun.phar /opt/n98-magerun.phar


RUN pwd
RUN printenv

#CMD ["/bin/bash", "/start.sh"]
