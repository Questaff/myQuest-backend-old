FROM ruby:2.6.2-stretch

RUN apt-get update -qq && \
apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN gem install bundler && \
bundle install

ENTRYPOINT ["bundle", "exec"]