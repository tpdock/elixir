FROM elixir:1.4

RUN \
        echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list && \
        apt-get update -y && \
        apt-get install -y libsystemd-dev gettext-base && \
        mix local.hex --force && \
        mix local.rebar --force
