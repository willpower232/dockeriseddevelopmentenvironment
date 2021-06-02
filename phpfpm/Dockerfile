FROM php:7.4-fpm

LABEL com.centurylinklabs.watchtower.enable="false"

# I don't know if this actually does anything
RUN ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

# dependencies
RUN apt update && apt install -y git zip unzip curl

# easy extension add tool
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
#ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

# extensions I seem to need all the time:
# binary calculation functions and precision handling
# image exif functions
# image manipulation functions
# internationalization and locale awareness functions
# mysqli integration
# execution caching
# pdo + mysql integration
# Tidy HTML clean and repair integration
# ZIP integration

RUN install-php-extensions bcmath exif gd imagick intl mcrypt mysqli opcache pdo_mysql tidy zip

# composer ftw
RUN curl -Ss https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer

# install any composer dependencies at the end

# install node if you want to add node-based binaries
#RUN apt update \
#	&& apt install -y gnupg \
#	&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
#	&& apt install -y nodejs npm \
#	&& apt purge -y --auto-remove gnupg

# for example, chrome-pdf
#RUN apt install -y gconf-service \
#	libasound2 \
#	libatk1.0-0 \
#	libatk-bridge2.0-0 \
#	libc6 \
#	libcairo2 \
#	libcups2 \
#	libdbus-1-3 \
#	libexpat1 \
#	libfontconfig1 \
#	libgcc1 \
#	libgconf-2-4 \
#	libgdk-pixbuf2.0-0 \
#	libglib2.0-0 \
#	libgtk-3-0 \
#	libnspr4 \
#	libpango-1.0-0 \
#	libpangocairo-1.0-0 \
#	libstdc++6 \
#	libx11-6 \
#	libx11-xcb1 \
#	libxcb1 \
#	libxcomposite1 \
#	libxcursor1 \
#	libxdamage1 \
#	libxext6 \
#	libxfixes3 \
#	libxi6 \
#	libxrandr2 \
#	libxrender1 \
#	libxss1 \
#	libxtst6 \
#	ca-certificates \
#	fonts-liberation \
#	libappindicator1 \
#	libnss3 \
#	lsb-release \
#	xdg-utils \
#	wget \
#	&& npm install -g --unsafe-perm chrome-pdf

# how to get wkhtmltopdf
#ADD https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb /tmp/
#RUN apt update \
#        && apt -y install libxrender1 fontconfig xfonts-base xfonts-75dpi libfreetype6 libjpeg62-turbo libpng16-16 libx11-6 libxcb1 libxext6 \
#        && dpkg -i /tmp/wkhtmltox_0.12.5-1.stretch_amd64.deb \
#        && rm /tmp/*.deb

# powershell support
#ADD https://github.com/PowerShell/PowerShell/releases/download/v6.1.2/powershell_6.1.2-1.debian.9_amd64.deb /tmp/
#ADD http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u10_amd64.deb /tmp/
#RUN apt update \
#        && apt -y install liblttng-ust0 \
#        && dpkg -i /tmp/libssl1.0.0_1.0.1t-1+deb8u10_amd64.deb \
#        && dpkg -i /tmp/powershell_6.1.2-1.debian.9_amd64.deb \
#        && rm /tmp/*.deb

RUN pecl install xdebug-3.0.1 \
    && docker-php-ext-enable xdebug;

# run things as your main user for ease
RUN mkdir /home/wh && useradd wh --shell /bin/bash && chown -R wh:wh /home/wh
USER wh
RUN mkdir -p /home/wh/.composer/cache/{files,repo}
WORKDIR /home/wh

RUN composer global require ergebnis/composer-normalize
