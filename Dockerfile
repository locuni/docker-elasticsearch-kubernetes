FROM quay.io/pires/docker-elasticsearch:5.5.2

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN mkdir -p /usr/share/elasticsearch/config && \
    ln -s /elasticsearch/config /usr/share/elasticsearch/config && \
    chown -R elasticsearch:elasticsearch /var/lib/elasticsearch && \
    chown -R elasticsearch:elasticsearch /var/run/elasticsearch && \
    chown -R elasticsearch:elasticsearch /elasticsearch

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false
