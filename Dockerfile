# Dockerfile
FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential

# RUN sudo apt-get install postgresql postgresql-contrib libpq-dev

# postgres
RUN apt-get install -y libpq-dev

# nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /nguoimexe_docker
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
