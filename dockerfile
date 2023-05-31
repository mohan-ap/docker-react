FROM node:18-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html  
#copying build folder and paste it in /app/usr/share/nginx/html folder , now automatically nginx server will run