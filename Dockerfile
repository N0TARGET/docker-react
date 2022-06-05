FROM node:alpine as base
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache
COPY . .
RUN npm run build

FROM nginx
COPY --from=base /app/build /usr/share/nginx/html

