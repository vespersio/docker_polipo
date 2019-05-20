FROM alpine:latest
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add bash openssh autossh nano polipo && \
    mkdir /etc/polipo
WORKDIR /etc/polipo/
VOLUME /etc/polipo/
EXPOSE 5000:5000/tcp 1080:1080/tcp
COPY ./config /etc/polipo/config
ENTRYPOINT ["polipo", "-c", "/etc/polipo/config"]
