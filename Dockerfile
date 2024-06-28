# Base image for dependencies
FROM node:20.9.0-alpine AS base

WORKDIR /app

COPY package*.json .

# Development stage
FROM base as dev

RUN npm install

COPY . .

EXPOSE 3500

CMD ["npm", "run", "dev"]

# Build stage
FROM dev AS build
RUN npm run build

# Production stage
FROM node:20.9.0-alpine AS production

WORKDIR /app

ENV NODE_ENV production

COPY package*.json .

RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm ci --only=production

# Copy the build output from the build stage
COPY --from=build /app/build ./build

EXPOSE 3500

CMD ["node", "build/index.js"]