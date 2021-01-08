# phase 0
FROM node:alpine
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# phase 1
FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html
# default command of nginx image is run nginx,
# therefore, no need to write a CMD instruction to start it manually