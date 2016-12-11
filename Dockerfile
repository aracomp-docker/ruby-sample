FROM ruby:2.2.0

RUN apt-get update -qq
RUN apt-get install -y build-essential

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app

ADD . $app

CMD ruby hello.rb
