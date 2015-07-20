FROM tpdock/erlang:all

MAINTAINER Vladimir Tarasenko vt@travelping.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /root

RUN git clone https://github.com/elixir-lang/elixir.git

WORKDIR /root/elixir

ENV _KERL_PATH_REMOVABLE "/usr/lib/erlang/17.4/bin"
ENV PATH "${_KERL_PATH_REMOVABLE}:$PATH"

RUN git checkout v1.0.5; make clean test; mkdir /usr/lib/elixir/1.0.5 -p; cp bin lib /usr/lib/elixir/1.0.5 -r;
RUN git checkout v1.0.4; make clean test; mkdir /usr/lib/elixir/1.0.4 -p; cp bin lib /usr/lib/elixir/1.0.4 -r;
RUN git checkout v1.0.3; make clean test; mkdir /usr/lib/elixir/1.0.3 -p; cp bin lib /usr/lib/elixir/1.0.3 -r;
RUN git checkout v1.0.2; make clean test; mkdir /usr/lib/elixir/1.0.2 -p; cp bin lib /usr/lib/elixir/1.0.2 -r;
RUN git checkout v1.0.1; make clean test; mkdir /usr/lib/elixir/1.0.1 -p; cp bin lib /usr/lib/elixir/1.0.1 -r;

ADD /tools/prepare.sh /root/prepare.sh
RUN /root/prepare.sh
