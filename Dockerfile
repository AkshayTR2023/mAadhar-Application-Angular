FROM node:14 as build

WORKDIR /app

COPY package*.json ./

RUN npm install -g @angular/cli

RUN npm install

COPY . .

FROM nginx:1.21.1

COPY --from=build /app/dist/m-aadhar-application /usr/share/nginx/html

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]