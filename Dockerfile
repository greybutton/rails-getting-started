FROM ruby:2.5.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn

RUN mkdir -p /rails-getting-started
WORKDIR /rails-getting-started

COPY Gemfile Gemfile.lock ./
COPY . /rails-getting-started

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000