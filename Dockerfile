FROM jenkins/jnlp-slave

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

ENV KUBECTL_VERSION=v1.9.0

USER root

# update system
RUN apt-get update -y && \
    apt-get install -y jq \
      libapparmor-dev \
      libseccomp-dev

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
