FROM hashicorp/consul-template:alpine
WORKDIR /consul-template

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

COPY src /consul-template
RUN chown -R consul-template:consul-template /consul-template