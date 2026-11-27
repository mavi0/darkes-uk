FROM nginx:stable-alpine-slim@sha256:e9eaa7298465eab06d618c51556fdcf3fb5061f9ff40bd28ee898fbd7ee7f900
COPY static-site /usr/share/nginx/html
