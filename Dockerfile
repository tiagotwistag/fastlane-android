FROM jangrewe/gitlab-ci-android

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
      build-essential \
      ruby-full \
      nodejs \
      yarn \
      git \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN gem update --system 3.0.8
RUN gem install bundler fastlane --no-document