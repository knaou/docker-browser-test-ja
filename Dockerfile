FROM alpine

COPY fonts/fonts.conf /root/.config/fontconfig/
COPY fonts/ipag.ttc /root/.local/share/fonts/

RUN apk add --no-cache \
         build-base curl ruby ruby-dev \
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

CMD ["rspec", "-r", "turnip/rspec"]

