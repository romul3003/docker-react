# configuration for production
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# copy from builder face  ./app/build folder to nginx
COPY --from=builder /app/build /usr/share/nginx/html
