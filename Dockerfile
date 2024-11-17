# Dockerfile
FROM node:18-alpine

# Set DNS
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the server
CMD ["npm", "run", "start"]
