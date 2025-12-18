FROM debian:12.12-slim
RUN cd /tmp \
  && apt update && apt install curl --yes \
  && curl -o supergraph.tgz https://rover.apollo.dev/tar/supergraph/x86_64-unknown-linux-gnu/v2.12.2 -L \
  && tar xvzf supergraph.tgz \
  && mv dist/supergraph /usr/local/bin/supergraph \
  && chmod +x /usr/local/bin/supergraph \
  && rm -rfv /tmp/*\
  && apt remove curl --yes

WORKDIR /
USER 65532:65532

ENTRYPOINT ["/usr/local/bin/supergraph"]
