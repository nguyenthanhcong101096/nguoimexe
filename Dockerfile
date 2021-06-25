FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt-get install nodejs -y

RUN npm install -g yarn

ENV APP_DIR /nguoimexe

RUN mkdir $APP_DIR

WORKDIR $APP_DIR

COPY Gemfile ./

RUN bundle install

COPY . .

RUN yarn install

RUN ./bin/webpack

RUN chmod u+x $APP_DIR/scripts/*

EXPOSE 3000
