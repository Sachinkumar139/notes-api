# select and official image 
FROM node:22-alpine

# Set the directory or create the directory where your application live
WORKDIR /app

# Copy files from your local project into the docker image to the current working directory
COPY package*.json ./

# Install dependencies . 
RUN npm ci --omit=dev

#after installing dependecies , copy the rest project
COPY . .

RUN npx prisma generate

# Express listening port is 3000
EXPOSE 3000

# Application startup command
CMD ["npm" , "start"]