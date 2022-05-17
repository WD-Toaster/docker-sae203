FROM debian:latest

RUN	apt-get update && \
	apt-get -y install \
	apache2
