FROM node:lts
ARG GITHUB_TOKEN

# Create app directory & copy everything
WORKDIR /usr/src/app
COPY . .

# Install app dependencies, using PAC for private repos
RUN git config --global url."https://${GITHUB_TOKEN}@github.com/jonfasking".insteadOf https://github.com/jonfasking
RUN npm install

# Transpile js
RUN ./node_modules/.bin/tsc

# This project needs a download dir
RUN mkdir download

# Cleanup unnecessary files
RUN rm -rf test README.md .gitignore Dockerfile package-lock.json tsconfig.json .git

# Expose port 8080 & start server
EXPOSE 8080
CMD [ "npm", "start" ]