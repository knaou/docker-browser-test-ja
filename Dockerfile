FROM ruby:2.3.0-alpine
MAINTAINER naou < monaou@gmail.com >

# Install ruby scripts and some tools
RUN apk update && apk add fontconfig ruby-dev ruby-nokogiri ruby-json build-base libxml2-dev libxslt-dev && \
    gem install rspec rspec-retry poltergeist capybara --no-ri --no-rdoc && \
    apk del build-base libxml2-dev libxslt-dev ruby-dev && \
    rm -rf /var/cache/apk/*

# Install dependencies of phantomjs
RUN curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz" | tar xz -C /

# Install phantomjs
RUN curl -Ls "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" | \
        tar jx -C /tmp phantomjs-2.1.1-linux-x86_64/bin/phantomjs && \
		mv /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
		rm -r /tmp/phantomjs-2.1.1-linux-x86_64

# Install ja-font
COPY fonts.conf /root/.config/fontconfig/
COPY ipag.ttc /root/.local/share/fonts/
RUN fc-cache -fv

# Expect spec files in /work
RUN mkdir -p /work/spec
WORKDIR /work

# ADD default files
COPY defaults/rspec /work/.rspec
COPY defaults/spec_helper.rb /work/spec/spec_helper.rb

CMD ["rspec"]
