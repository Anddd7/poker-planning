# Stage 1: Build the React application
FROM node:16 as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve the React application from Nginx
FROM nginx:1.21.1-alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh entrypoint.sh

EXPOSE 80

ENTRYPOINT ["sh", "entrypoint.sh"]