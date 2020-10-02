FROM node:lts-alpine3.9 AS BUILD-stage

WORKDIR /var/productionApp

COPY ./package*.json ./

RUN npm install

COPY . . 

RUN npm run build

FROM nginx:alpine AS DEPLOY-stage

COPY --from=BUILD-stage /var/productionApp/build /usr/share/nginx/html

EXPOSE 80