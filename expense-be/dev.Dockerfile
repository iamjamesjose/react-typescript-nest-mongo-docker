FROM node:16-alpine AS builder
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY ./package-lock.json ./package.json ./tsconfig.json ./
RUN npm ci --no-save
# Copy app files
COPY . .
# Expose port
EXPOSE 3000
# Start the app
CMD [ "npm", "run", "start" ]