FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

ENV TERM=xterm

RUN apt update && apt upgrade -y
RUN apt upgrade --fix-missing -y
RUN apt install -y libreadline-dev wget cmake valgrind make clang

RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2 \
	&& tar xvf criterion-v2.3.3-linux-x86_64.tar.bz2
RUN cp -r /criterion-v2.3.3/lib/* /usr/lib/ \
	&& cp -r /criterion-v2.3.3/include/* /usr/include/ \
	&& rm criterion-v2.3.3-linux-x86_64.tar.bz2

RUN useradd -m user1
RUN apt install sudo

ENTRYPOINT make test
