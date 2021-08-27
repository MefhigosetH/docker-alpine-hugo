FROM alpine:3.14

ENV HUGO_VERSION 0.87.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

WORKDIR /opt

RUN apk update && apk upgrade && apk add py-pygments && rm -rf /var/cache/apk/*

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz && \
    tar xzf ${HUGO_BINARY}.tar.gz && \
    mv ./hugo /usr/local/bin/ && \
    hugo version

EXPOSE 1313

CMD hugo version
