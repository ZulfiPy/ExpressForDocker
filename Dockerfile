# Base image for dependencies
FROM node:18 AS base
WORKDIR /app
COPY package*.json .

# Development stage
FROM base as dev
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]

# Build stage
FROM dev AS build
RUN npm run build

# Production stage
FROM node:18 AS production
WORKDIR /app
COPY package*.json .
COPY .env ./
RUN npm ci --only=production
# Copy the build output from the build stage
COPY --from=build /app/build ./build
CMD ["node", "build/index.js"]