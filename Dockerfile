FROM ghcr.io/gohugoio/hugo:v0.140.2 as builder
USER root
WORKDIR /hugo-scroll
COPY . /hugo-scroll
RUN hugo --destination=/output --source=darkes --themesDir=../..

FROM nginx:alpine
COPY --from=builder /output /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
