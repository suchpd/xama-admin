FROM node:16.15.0 as builder
WORKDIR /usr/myProject/xama-admin

COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:latest
WORKDIR /environmentSetup/nginxcfg/html

RUN rm -rf ./*

COPY --from=builder /usr/myProject/xama-admin/dist/xama-admin /environmentSetup/nginxcfg/html

# FROM nginx:latest
# WORKDIR /environmentSetup/nginxcfg/html

# RUN rm -rf ./*

# COPY /usr/myProject/xama-admin /environmentSetup/nginxcfg/html