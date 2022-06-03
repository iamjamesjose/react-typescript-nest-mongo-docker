FROM node:16-alpine AS builder
# Add a work directory
WORKDIR /app
RUN adduser -S app
# Cache and Install dependencies
COPY ./package-lock.json ./package.json ./tsconfig.build.json ./tsconfig.json ./nest-cli.json ./
RUN npm ci --no-save
# Copy app files
COPY . .
RUN chown -R app /app
# Start the app
USER app
# Expose port
EXPOSE 3001
CMD [ "npm", "run", "start:dev" ]