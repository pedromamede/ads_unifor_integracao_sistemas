FROM ruby:3.1.0

RUN gem install puma sinatra

COPY ./ /
WORKDIR /

CMD ["puma", "config.ru", "-C", "puma.rb"]
