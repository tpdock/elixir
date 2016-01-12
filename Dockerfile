FROM tpdock/erlang:base

MAINTAINER Vladimir Tarasenko vt@travelping.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /root

RUN git clone https://github.com/elixir-lang/elixir.git

WORKDIR /root/elixir

RUN git checkout v1.1.1; make clean; make; mkdir /usr/lib/elixir/1.1.1 -p; cp bin lib /usr/lib/elixir/1.1.1 -r;
RUN git checkout v1.2.0; make clean; make; mkdir /usr/lib/elixir/1.2.0 -p; cp bin lib /usr/lib/elixir/1.2.0 -r;
RUN git checkout v1.1.0; make clean; make; mkdir /usr/lib/elixir/1.1.0 -p; cp bin lib /usr/lib/elixir/1.1.0 -r;
RUN git checkout v1.1.0-rc.0; make clean; make; mkdir /usr/lib/elixir/1.1.0-rc.0 -p; cp bin lib /usr/lib/elixir/1.1.0-rc.0 -r;
RUN git checkout v1.1.0-beta; make clean; make; mkdir /usr/lib/elixir/1.1.0-beta -p; cp bin lib /usr/lib/elixir/1.1.0-beta -r;
RUN git checkout b83cd9b514fc2b18245e07d812a7154d7f00ff70; make clean; make; mkdir /usr/lib/elixir/1.1.0-dev -p; cp bin lib /usr/lib/elixir/1.1.0-dev -r;
RUN git checkout v1.0.5; make clean; make; mkdir /usr/lib/elixir/1.0.5 -p; cp bin lib /usr/lib/elixir/1.0.5 -r;
RUN git checkout v1.0.4; make clean; make; mkdir /usr/lib/elixir/1.0.4 -p; cp bin lib /usr/lib/elixir/1.0.4 -r;
RUN git checkout v1.0.3; make clean; make; mkdir /usr/lib/elixir/1.0.3 -p; cp bin lib /usr/lib/elixir/1.0.3 -r;
RUN git checkout v1.0.2; make clean; make; mkdir /usr/lib/elixir/1.0.2 -p; cp bin lib /usr/lib/elixir/1.0.2 -r;
RUN git checkout v1.0.1; make clean; make; mkdir /usr/lib/elixir/1.0.1 -p; cp bin lib /usr/lib/elixir/1.0.1 -r;

ADD /tools/prepare.sh /root/prepare.sh
RUN /root/prepare.sh

#RUN mix local.hex --force
ADD https://s3.amazonaws.com/s3.hex.pm/installs/1.0.0/hex.ez /root/.mix/archives/hex.ez

CMD . elixir-1.2.0;bash
