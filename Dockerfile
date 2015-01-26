FROM ubuntu:14.04

RUN apt-get update 
RUN apt-get install -y build-essential vim git-core curl zlib1g-dev \ 
  libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev \
  libcurl4-openssl-dev python-software-properties mysql-client \
  libmysqlclient-dev  zlib1g-dev libpcre3 libpcre3-dev libgdbm-dev \
  libncurses5-dev automake libtool bison libffi-dev python-dev\
  software-properties-common \
  wget dialog net-tools

RUN add-apt-repository -y ppa:nginx/development
RUN apt-get update -y
RUN apt-get install -y nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

ENV TERM xterm

ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
CMD ["nginx", "-g", "daemon off;"]
