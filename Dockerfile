FROM mhart/alpine-node:latest AS build
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm ci
ADD . /app
RUN npm run test:ci
RUN npm run build
RUN npm ci --prod

FROM mhart/alpine-node:base
WORKDIR /app
ENV NODE_ENV="production"
COPY --from=build /app .
ENTRYPOINT ["./node_modules/.bin/micro", "dist/index.js"]