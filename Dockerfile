FROM docker:19.03.4

COPY init-kubectl kubectl /usr/local/bin/

USER root

RUN apk --update add \
    python \
    curl \
    groff; \
    set -ex; \
    wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
    && python get-pip.py --disable-pip-version-check --no-cache-dir \
    && pip install awscli

RUN curl -sSL https://github.com/shyiko/kubetpl/releases/download/0.9.0/kubetpl-0.9.0-linux-amd64 -o kubetpl && chmod a+x kubetpl && mv kubetpl /usr/local/bin/

ENV PATH="/usr/local/bin:$PATH"

ENTRYPOINT []

CMD ["--help"]
