FROM node:lts-gallium as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install && run build

FROM nginxinc/nginx-unprivileged
COPY --from=build /usr/src/app/build /usr/share/nginx/html
