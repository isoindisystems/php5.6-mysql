FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 8000/udp
EXPOSE 8000/tcp

# Install basics
RUN apt-get update
RUN apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y --force-yes curl git

# Install MySQL
RUN apt-get install -y mysql-server

# Install PHP 5.6
RUN apt-get install -y --allow-unauthenticated php5.6 php5.6-mysql php5.6-mcrypt php5.6-cli php5.6-gd php5.6-curl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /app
WORKDIR /app

CMD ["./run.sh"]
