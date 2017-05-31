FROM ruby:2.4.1

RUN apt-get update
RUN apt-get install -y build-essential curl libpq-dev nodejs postgresql-client

WORKDIR /app
ADD . /app

RUN bundle install --jobs 9

EXPOSE 3000

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*