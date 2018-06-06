FROM php:7.2-cli-alpine3.7

MAINTAINER innovatorjapan <system@innovator.jp.net>

ARG version=1.14.69

RUN apk -v --update add jq  python  py-pip  ca-certificates  \
    && pip install awscli==${version} \
    && apk add openssh \
    && apk -v --purge del py-pip \ 
    &&  rm -rf /var/cache/apk/* 

ADD deployer.phar /usr/local/bin/dep

RUN chmod +x /usr/local/bin/dep

CMD ["/bin/sh"]