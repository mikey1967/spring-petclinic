FROM node:16
RUN git clone https://github.com/gothinkster/angular-realworld-example-app.git && cd angular-realworld-example-app && npm install -g npm@9.7.1 && npm update && npm install
EXPOSE 4200
WORKDIR /angular-realworld-example-app
CMD ["ng", "serve","--host","0.0.0.0"]