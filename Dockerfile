FROM curlimages/curl:8.17.0 AS installer
ENV VERSION=v0.37.0
RUN curl -sSL https://rover.apollo.dev/nix/$VERSION | sh

FROM gcr.io/distroless/static:latest@sha256:ce46866b3a5170db3b49364900fb3168dc0833dfb46c26da5c77f22abb01d8c3
COPY --from=installer /home/curl_user/.rover/bin/rover /rover

WORKDIR /
USER 65532:65532

ENTRYPOINT ["/rover"]
