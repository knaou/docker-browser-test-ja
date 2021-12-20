FROM alpine

RUN mkdir -p /usr/share/fonts/ipa /etc/fonts
COPY fonts/ipag.ttc /usr/share/fonts/ipa/
RUN apk add --no-cache \
         build-base curl ruby ruby-dev ruby-etc \
         fontconfig udev chromium chromium-chromedriver ruby-nokogiri ruby-json \
    && gem install \
      rspec rspec-retry \
      capybara \
      turnip bigdecimal \
      selenium-webdriver \
      did_you_mean \
    && fc-cache -fv \
    && apk del build-base ruby-dev \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /work/spec
WORKDIR /work
COPY defaults/spec_helper.rb /work/spec/spec_helper.rb
COPY defaults/turnip_helper.rb /work/spec/turnip_helper.rb

CMD ["rspec", "-r", "turnip/rspec", "-f", "documentation"]

