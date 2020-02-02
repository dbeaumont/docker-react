FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# All we now care about is in /app/build

FROM nginx
# cf nginx doc in hub.docker.com for taeget directory which exposes our static files
COPY --from=builder /app/build /usr/share/nginx/html  
