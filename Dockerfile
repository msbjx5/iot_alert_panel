FROM ruby:2.6.3

WORKDIR /home

COPY Gemfile /home
#COPY Gemfile.lock /home

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && apt-get update -qq

RUN gem install bundler && bundle install
