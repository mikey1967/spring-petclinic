FROM node:16
RUN git clone https://github.com/gothinkster/angular-realworld-example-app.git && cd angular-realworld-example-app && npm install -g npm@9.7.1 && npm install && npm update && npm install npm@latest -g
EXPOSE 4200
WORKDIR /angular-realworld-example-app
CMD ["ng", "serve","--host","0.0.0.0"]