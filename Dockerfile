FROM tpdock/erlang:base

MAINTAINER Vladimir Tarasenko vt@travelping.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /root

RUN git clone https://github.com/elixir-lang/elixir.git

WORKDIR /root/elixir

RUN git checkout v1.3.0; make clean; make; mkdir /usr/lib/elixir/1.3.0 -p; cp bin lib /usr/lib/elixir/1.3.0 -r;
RUN git checkout v1.2.0; make clean; make; mkdir /usr/lib/elixir/1.2.0 -p; cp bin lib /usr/lib/elixir/1.2.0 -r;
RUN git checkout v1.1.1; make clean; make; mkdir /usr/lib/elixir/1.1.1 -p; cp bin lib /usr/lib/elixir/1.1.1 -r;
RUN git checkout v1.1.0; make clean; make; mkdir /usr/lib/elixir/1.1.0 -p; cp bin lib /usr/lib/elixir/1.1.0 -r;

ADD /tools/prepare.sh /root/prepare.sh
RUN /root/prepare.sh

#RUN mix local.hex --force
ADD https://s3.amazonaws.com/s3.hex.pm/installs/1.0.0/hex.ez /root/.mix/archives/hex.ez

CMD . elixir-1.3.0;bash
