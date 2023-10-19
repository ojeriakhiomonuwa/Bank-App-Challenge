# FROM node:alpine3.16
# WORKDIR /client
# COPY . .
# RUN npm install
# EXPOSE 3000
# CMD ["npm", "start"]

FROM node:alpine3.16 As build
WORKDIR /client
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.19.0 As prod
COPY --from=build /client/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
