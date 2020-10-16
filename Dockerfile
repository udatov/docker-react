FROM node:alpine as builder

WORKDIR '/opt/app'

COPY package.json .
RUN npm config set registry http://registry.npmjs.org/
RUN npm config set proxy "http://yuzdze-c-32001.europe.shell.com:8080"
RUN npm install

COPY . .

RUN npm run build

FROM nginx 
COPY --from=builder /opt/app/build /usr/share/nginx/html

