FROM docker:19.03.4

USER root

RUN apk --update add \
    python \
    curl \
    groff; \
    set -ex; \
    wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
    && python get-pip.py --disable-pip-version-check --no-cache-dir \
    && pip install awscli

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x ./aws-iam-authenticator
RUN mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator


RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv ./kubectl /usr/local/bin/

RUN curl -sSL https://github.com/shyiko/kubetpl/releases/download/0.9.0/kubetpl-0.9.0-linux-amd64 -o kubetpl && chmod a+x kubetpl && mv kubetpl /usr/local/bin/

ENV PATH="/usr/local/bin:$PATH"

RUN adduser -Dh /home/ktool ktool

USER ktool
WORKDIR /home/ktool
RUN mkdir .kube

ENTRYPOINT []

CMD ["--help"]
