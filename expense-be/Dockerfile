FROM node:16-alpine AS builder
RUN mkdir /app
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY ./package-lock.json ./package.json ./tsconfig.build.json ./tsconfig.json ./nest-cli.json ./  
RUN npm ci --no-save
COPY ./src ./src
CMD [ "npm", "run", "build" ]

FROM node:16-alpine
# Add a work directory
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY ./serve.json ./dist

EXPOSE 3001
USER app
CMD [ "node", "dist/main" ]
