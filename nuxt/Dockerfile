FROM node:16-slim
#COPY . /tmp/
RUN cd /usr \
    && apt-get update  -y \
    && apt-get upgrade -y \
    && npm install -g npm@latest \
    && apt-get install -y git \
    && cd /usr \
    && git clone -b 0.0.0 https://github.com/devcompru/client.git  app \
    && cd /usr/app \
    && rm static/robots.txt \
    #&& mv -f static/robots_production.txt static/robots.txt \
    && npm install --force \
    && npm run build \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/app
CMD [ "npm", "run", "dev" ]