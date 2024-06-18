#Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

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