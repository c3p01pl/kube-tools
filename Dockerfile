FROM bitnami/kubectl:1.13

COPY init-kubectl kubectl /usr/local/bin/

USER root

RUN curl -sSL https://github.com/shyiko/kubetpl/releases/download/0.9.0/kubetpl-0.9.0-linux-amd64 -o kubetpl && chmod a+x kubetpl && mv kubetpl /usr/local/bin/

ENV PATH="/usr/local/bin:$PATH"

ENTRYPOINT []

CMD ["--help"]
