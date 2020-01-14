FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FROM is like a block terminator
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nignx starts automatically so no need to mention a start command