FROM node:10-alpine
LABEL MAINTAINER="briangonzalez squaredlabs"
LABEL version="1.1"

# Create app directory
RUN mkdir -p /app
COPY . /app


# Expose the app port
EXPOSE 3000

ONBUILD ARG autobuild=yes
ONBUILD ENV autobuild ${autobuild}

# Copy files.

ONBUILD COPY . /app
ONBUILD WORKDIR /app
ONBUILD RUN cd ./server && npm install
ONBUILD RUN npm install
ONBUILD WORKDIR /app

ONBUILD RUN if [ "${autobuild}" = "yes" ]; then ./node_modules/.bin/nuxt build; fi

CMD ["npm", "start"]
