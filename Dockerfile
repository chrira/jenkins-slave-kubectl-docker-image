FROM jenkinsci/jnlp-slave

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

ENV GCLOUND_VERSION=192.0.0
ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

USER root

# update system
RUN apt-get update -y && \
    apt-get install -y jq \
      libapparmor-dev \
      libseccomp-dev

RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUND_VERSION}-linux-x86_64.tar.gz | tar xvz && \
    mv google-cloud-sdk /opt && \
    gcloud components install kubectl
