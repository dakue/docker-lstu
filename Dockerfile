FROM alpine:latest

ENV LSTU_HOME /lstu

RUN set -x && \
  apk add --update wget ca-certificates tar bash build-base perl perl-dev openssl-dev libidn-dev && \
  mkdir -p $LSTU_HOME && \
  wget -nv "https://github.com/ldidry/lstu/tarball/master" -O- \
  | tar xz --strip-component=1 -C $LSTU_HOME && \
  echo | cpan && \
  cpan install Carton && \
  cd $LSTU_HOME && \
  carton install && \
  apk del wget ca-certificates tar build-base perl-dev openssl-dev libidn-dev && \
  apk add libidn openssl && \
  rm -rf /root/.cpan && \
  rm -rf /root/.cpanm && \
  rm /var/cache/apk/*

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["lstu"]
