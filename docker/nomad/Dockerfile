FROM debian:9.5

ARG NOMAD_VERSION=0.8.6

RUN useradd -U nomad

RUN mkdir -p /nomad/data && \
    mkdir -p /etc/nomad && \
    chown -R nomad:nomad /nomad

RUN apt-get update && apt-get install -y gnupg curl ca-certificates unzip

RUN cd /tmp \
      && curl -L -o nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip \
      && curl -L -o nomad_${NOMAD_VERSION}_SHA256SUMS      https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_SHA256SUMS \
      && curl -L -o nomad_${NOMAD_VERSION}_SHA256SUMS.sig  https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_SHA256SUMS.sig \
      && export GNUPGHOME="$(mktemp -d)" \
      && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C \
      && gpg --batch --verify nomad_${NOMAD_VERSION}_SHA256SUMS.sig nomad_${NOMAD_VERSION}_SHA256SUMS \
      && grep nomad_${NOMAD_VERSION}_linux_amd64.zip nomad_${NOMAD_VERSION}_SHA256SUMS | sha256sum -c \
      && unzip -d /bin nomad_${NOMAD_VERSION}_linux_amd64.zip \
      && chmod +x /bin/nomad \
      && rm -rf "$GNUPGHOME" nomad_${NOMAD_VERSION}_linux_amd64.zip nomad_${NOMAD_VERSION}_SHA256SUMS nomad_${NOMAD_VERSION}_SHA256SUMS.sig

EXPOSE 4646 4647 4648 4648/udp

COPY default.hcl /etc/nomad/default.hcl
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

VOLUME ["/opt/nomad"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
