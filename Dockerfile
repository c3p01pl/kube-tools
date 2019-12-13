FROM ubuntu:latest

USER root

#Install aws-cli,make,git
RUN apt update && apt install -y \
    python \
    wget \
    git \
    make \
    curl &&\
    wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' && \
    python get-pip.py --disable-pip-version-check --no-cache-dir && \
    pip install awscli

#Install iam-authenticator
RUN curl -sSLO https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator &&  mv ./aws-iam-authenticator /usr/local/bin/

#Install kubectl
RUN curl -sSLO https://storage.googleapis.com/kubernetes-release/release/$(curl -s \
    https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl && mv ./kubectl /usr/local/bin/

#Install kubetpl
RUN curl -sSL https://github.com/shyiko/kubetpl/releases/download/0.9.0/kubetpl-0.9.0-linux-amd64 -o kubetpl && \
    chmod a+x kubetpl && mv kubetpl /usr/local/bin/

ENV PATH="/usr/local/bin:$PATH"

ENTRYPOINT []

