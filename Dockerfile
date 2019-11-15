FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y yarn
RUN mkdir /instagram

WORKDIR /instagram

ADD Gemfile /instagram/Gemfile
ADD Gemfile.lock /instagram/Gemfile.lock

RUN bundle install

ADD . /instagram
