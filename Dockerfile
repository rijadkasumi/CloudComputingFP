# Use an official Node.js image as a base
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build the React app
RUN npm run build

# Install a simple server to serve your built React app
RUN npm install -g serve

# Serve the app
CMD ["serve", "-s", "build"]

# Expose the port that the app runs on
EXPOSE 3000
