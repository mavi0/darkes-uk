FROM ghcr.io/gohugoio/hugo:v0.170.1@sha256:4cc9f383086c0fba180efcf7132cf2f025969c462fedf5fcd2bf921915416797 AS builder
USER root
WORKDIR /hugo-scroll
COPY . /hugo-scroll
RUN hugo --destination=/output --source=darkes --themesDir=../..

FROM nginx:stable-alpine-slim@sha256:8c950211a641ec5b23f265450517001f6bcca533666120ebe36cb4cff3d00a55
COPY --from=builder /output /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
