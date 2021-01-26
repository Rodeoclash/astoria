#
# Development
#

FROM elixir:1.11 as development

EXPOSE 4000

ENV APP_HOME=/usr/src/app \
  HEX_HOME=/opt/hex \
  LANG=C.UTF-8 \
  MIX_HOME=/opt/mix \
  REFRESHED_AT=2020-12-01 \
  WATCHMAN_VERSION=2020.08.03.00

WORKDIR $APP_HOME

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -

# Install libs
RUN apt-get update && \
    apt-get install -yq \
    inotify-tools \
    nodejs \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Watchman
RUN curl -LO https://github.com/facebook/watchman/releases/download/v${WATCHMAN_VERSION}/watchman-v${WATCHMAN_VERSION}-linux.zip && \
    unzip watchman-v${WATCHMAN_VERSION}-linux.zip && \
    cd watchman-v${WATCHMAN_VERSION}-linux && \
    cp bin/* /usr/local/bin && \
    cp lib/* /usr/local/lib && \
    chmod 755 /usr/local/bin/watchman && \
    mkdir -p /usr/local/var/run/watchman && \
    chmod 2777 /usr/local/var/run/watchman && \
    rm -rf watchman

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
RUN MIX_ENV=prod mix release astoria

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
