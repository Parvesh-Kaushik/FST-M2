# Specify base image
FROM node:18-alpine

# Create working directory
WORKDIR /usr/app

# Copy the file into the container
COPY package.json ./

#Install dependencies
RUN npm install

#Copy all the other file into the container
COPY ./ ./

# Start the server
CMD ["npm", "start"]