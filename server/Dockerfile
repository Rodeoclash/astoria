#
# Development
#

FROM elixir:1.10 as development

ENV APP_HOME /usr/src/app
ENV LANG C.UTF-8

EXPOSE 4000

WORKDIR $APP_HOME

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

# Install libs
RUN apt-get update && \
    apt-get install -yq \
    inotify-tools \
    nodejs \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# install supporting tools
RUN mix local.hex --force
RUN mix local.rebar --force

# copy dependencies
COPY ./config config
COPY ./mix.exs ./mix.lock ./.formatter.exs ./

RUN MIX_ENV=dev mix do deps.get, deps.compile
RUN MIX_ENV=test mix do deps.get deps.compile

# copy in the applications
COPY ./assets assets
COPY ./lib lib
COPY ./priv priv
COPY ./test test

# build frontend
RUN npm install --prefix assets
RUN npm run deploy --prefix assets
RUN mix phx.digest

# create a release
# RUN MIX_ENV=prod mix release astoria

CMD mix phx.server

#
# Deploy
#
FROM debian:buster-slim as deploy

ENV APP_HOME /usr/src/app
ENV LANG C.UTF-8

EXPOSE 4000

WORKDIR $APP_HOME

# Install libs
RUN apt-get update && \
    apt-get install -yq \
    libssl-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY --from=development $APP_HOME/_build/prod/rel/astoria $APP_HOME

CMD bin/astoria start
