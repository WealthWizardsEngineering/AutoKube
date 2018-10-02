FROM hashicorp/consul-template:alpine
WORKDIR /consul-template
COPY src /consul-template
RUN chown -R consul-template:consul-template /consul-template