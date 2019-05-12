FROM node:10-alpine as builder
WORKDIR /app
COPY package*.json /app/
COPY yarn.lock /app/
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
COPY ./ /app/
RUN npm run build

FROM nginx:1.15.12-alpine
COPY --from=builder /app/build/ /var/www
COPY nginx.conf /etc/nginx/nginx.conf
COPY gzip.conf /etc/nginx/conf.d/gzip.conf
EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]