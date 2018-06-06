FROM php:7.2-cli-alpine3.7

MAINTAINER innovatorjapan <system@innovator.jp.net>

ARG version=1.14.69

RUN apk -v --update add jq  python  py-pip  ca-certificates  \
    && pip install awscli==${version} \
    && apk add openssh rsync \
    && apk -v --purge del py-pip \ 
    &&  rm -rf /var/cache/apk/* 

ADD deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

ADD find_alb_ips.sh /usr/local/bin/find_alb_ips
RUN chmod +x /usr/local/bin/find_alb_ips

CMD ["/bin/sh"]