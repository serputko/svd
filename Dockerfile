# Use the barebones version of Ruby 2.2.3.
FROM ruby:2.2.3-slim

MAINTAINER Sasha <dobrunya777@gmail.com>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /study/svd
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY . .
COPY Gemfile Gemfile
RUN bundle install
RUN gem install rake -v '11.3.0'
RUN gem install minitest -v '5.9.1'
RUN gem install rails -v '4.1.14.2'
RUN gem install public_suffix -v '2.0.3'
RUN gem install  autoprefixer-rails -v '6.5.2'

# Copy in the application code from your work station at the current directory
# over to the working directory.


# Provide dummy data to Rails so it can pre-compile assets.
# RUN bundle exec rake RAILS_ENV=development

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]
