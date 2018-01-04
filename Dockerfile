FROM ruby:2.5.0

RUN mkdir /bblog
WORKDIR /bblog

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
