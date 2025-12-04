FROM debian:12.12-slim
ENV VERSION=v0.37.0
RUN apt update && apt install --yes curl && /bin/sh -c "curl -sSL https://rover.apollo.dev/nix/$VERSION | sh" && mv /root/.rover/bin/rover /usr/local/bin
RUN useradd -u 65532 -d /home/rover rover
RUN mkdir -p /home/rover/.rover/bin && mkdir -p /home/rover/.config/rover && chown -R rover:rover /home/rover/.config/rover 
RUN cd /tmp && curl -o supergraph.tgz https://rover.apollo.dev/tar/supergraph/x86_64-unknown-linux-gnu/v2.12.1 -L && tar xvzf supergraph.tgz && mv dist/supergraph /home/rover/.rover/bin/supergraph-v2.12.1 && rm -rfv /tmp/*
USER rover

WORKDIR /
USER 65532:65532

ENTRYPOINT ["/usr/local/bin/rover"]
