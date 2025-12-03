FROM alpine:3.22.2
ENV VERSION=v0.37.0
RUN apk update && apk add curl && /bin/sh -c "curl -sSL https://rover.apollo.dev/nix/$VERSION | sh" && mv /root/.rover/bin/rover /usr/local/bin
WORKDIR /
USER 65532:65532

ENTRYPOINT ["/usr/local/bin/rover"]
