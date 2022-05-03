FROM node:16-alpine AS builder
RUN mkdir /app
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY ./package-lock.json ./package.json ./tsconfig.json ./  
RUN npm ci --no-save
COPY ./public ./public
COPY ./src ./src
CMD [ "npm", "run", "build" ]

FROM node:16-alpine
# Add a work directory
RUN mkdir /app
WORKDIR /app
RUN npm install serve -g
COPY ./public ./public
COPY --from=builder /app/build ./build
COPY ./serve.json ./build
EXPOSE 3000
CMD serve -s build -l 3000