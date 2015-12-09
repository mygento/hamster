FROM mygento/phpenv:latest

MAINTAINER Nikita Tarasov <nikita@mygento.ru>

RUN mkdir -p /opt/magento

RUN wget --no-check-certificate -O /opt/magento/1.9.2.2.zip https://github.com/bragento/magento-core/archive/1.9.2.2-patch1.zip && \
	unzip -q /opt/magento/1.9.2.2.zip -d /opt/magento/1.9.2.2 && \
	mv /opt/magento/1.9.2.2/magento-core-1.9.2.2-patch1/* /opt/magento/1.9.2.2/magento-core-1.9.2.2-patch1/.htaccess /opt/magento/1.9.2.2/ && \
	rm /opt/magento/1.9.2.2.zip && \
	rm -fR /opt/magento/1.9.2.2/magento-core-1.9.2.2-patch1

RUN wget --no-check-certificate -O /opt/magento/1.8.1.0.zip https://github.com/bragento/magento-core/archive/1.8.1.0-patch2.zip && \
        unzip -q /opt/magento/1.8.1.0.zip -d /opt/magento/1.8.1.0 && \
        mv /opt/magento/1.8.1.0/magento-core-1.8.1.0-patch2/* /opt/magento/1.8.1.0/magento-core-1.8.1.0-patch2/.htaccess /opt/magento/1.8.1.0/ && \
        rm /opt/magento/1.8.1.0.zip && \
        rm -fR /opt/magento/1.8.1.0/magento-core-1.8.1.0-patch2

RUN wget --no-check-certificate -O /opt/magento/1.7.0.2.zip https://github.com/bragento/magento-core/archive/1.7.0.2-patch8.zip && \
        unzip -q /opt/magento/1.7.0.2.zip -d /opt/magento/1.7.0.2 && \
        mv /opt/magento/1.7.0.2/magento-core-1.7.0.2-patch8/* /opt/magento/1.7.0.2/magento-core-1.7.0.2-patch8/.htaccess /opt/magento/1.7.0.2/ && \
        rm /opt/magento/1.7.0.2.zip && \
        rm -fR /opt/magento/1.7.0.2/magento-core-1.7.0.2-patch8


RUN wget --no-check-certificate -O /opt/magento/1.6.2.0.zip https://github.com/bragento/magento-core/archive/1.6.2.0-patch2.zip && \
        unzip -q /opt/magento/1.6.2.0.zip -d /opt/magento/1.6.2.0 && \
        mv /opt/magento/1.6.2.0/magento-core-1.6.2.0-patch2/* /opt/magento/1.6.2.0/magento-core-1.6.2.0-patch2/.htaccess /opt/magento/1.6.2.0/ && \
        rm /opt/magento/1.6.2.0.zip && \
        rm -fR /opt/magento/1.6.2.0/magento-core-1.6.2.0-patch2
