# develop stage
FROM node:16.16.0-alpine as develop-stage
WORKDIR /app
COPY package*.json ./
RUN yarn global add @quasar/cli
COPY . .
# build stage
FROM develop-stage as build-stage
RUN yarn
RUN quasar build
# production stage
FROM nginx:stable-alpine3.17 as production-stage
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
