FROM node:lts-alpine3.9 as BUILD-stage

WORKDIR /var/productionApp

COPY ./package*.json ./

RUN npm install

COPY . . 

RUN npm run build

FROM nginx:alpine as DEPLOY-stage

COPY --from=BUILD-stage /var/productionApp/build /usr/share/nginx/html

EXPOSE 80