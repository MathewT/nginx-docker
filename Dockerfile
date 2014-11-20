
FROM ubuntu

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list


RUN apt-get -qq update 
RUN apt-get -qq install -y software-properties-common

RUN apt-get -qq install -y build-essential  \
        zlib1g-dev libssl-dev \
        libreadline-dev libyaml-dev libxml2-dev \
        libxslt1-dev libcurl4-openssl-dev python-software-properties \
        zlib1g-dev libpcre3 libpcre3-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev \
	nano wget dialog net-tools


RUN apt-get -qq install -y nginx

# Remove the default nginx.conf
# RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
# ADD nginx.conf /etc/nginx/

EXPOSE 80


# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
# CMD ["service", "nginx", "start"]

