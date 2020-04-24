FROM alpine:3.10

RUN apk update \
 && apk upgrade

RUN set -x && apk add --no-cache --update zip ca-certificates git

RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

ENV USACLOUD_VERSION=0.32.2

ADD https://github.com/sacloud/usacloud/releases/download/v${USACLOUD_VERSION}/usacloud_linux-amd64.zip ./
RUN unzip usacloud_linux-amd64.zip -d /bin; rm -f usacloud_linux-amd64.zip
