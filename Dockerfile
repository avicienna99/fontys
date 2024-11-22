# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Install system dependencies (SQLite, Python, and build tools)
RUN apk add --no-cache python3 g++ make sqlite

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install Node.js dependencies (production-only)
RUN yarn install --production

# Command to run the application
CMD ["node", "src/index.js"]

# Expose port 3000 for the application
EXPOSE 3000
