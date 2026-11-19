FROM ghcr.io/gohugoio/hugo:v0.140.2@sha256:4349edcdfb8086fbb972fc5b52805a1ba9d40e6a287e64f06fd26a3edc68e175 AS builder
USER root
WORKDIR /hugo-scroll
COPY . /hugo-scroll
RUN hugo --destination=/output --source=darkes --themesDir=../..

FROM nginx:stable-alpine-slim@sha256:8c950211a641ec5b23f265450517001f6bcca533666120ebe36cb4cff3d00a55
COPY --from=builder /output /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
