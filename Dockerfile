FROM ruby:2.7.5-buster as environment_setup

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install vim

ARG CACHEBUST=2
RUN echo $CACHEBUST

RUN  gem install bundler:2.3.11
WORKDIR /app
COPY Gemfile Gemfile.lock *.gemspec /app/

RUN  bundle install
COPY ./views/ /app/views/
COPY server.rb /app/server.rb

EXPOSE 4567

CMD ["ruby", "/app/server.rb"]

# Note: If building on Apple M1 silicon, use the following:
# `docker buildx build --push --tag ghcr.io/usnistgov/v2plus-demo:latest -o type=image --platform=linux/arm64,linux/amd64 .`

# Launch on hit-dev (assuming correct port is 14070) using something like this...
# `docker run --rm -d -p 14070:4567 --name v2plus ghcr.io/usnistgov/v2plus-demo`
# OR, perhaps...
# `docker run --rm -d -p 14070:4567 --name v2plus --pull always ghcr.io/usnistgov/v2plus-demo`
