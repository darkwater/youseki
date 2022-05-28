FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev
RUN gem install bundler
RUN bundle config --global frozen 1

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

RUN rails assets:precompile

EXPOSE 3000

CMD [ "./entrypoint.sh" ]
# CMD ["bundle", "exec", "rails", "server", "-e", "production"]
