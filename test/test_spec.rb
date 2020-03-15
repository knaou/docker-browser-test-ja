require 'spec_helper'
feature 'test' do
  given(:site) { "http://nginx/" }
  background do
    page.driver.browser.manage.window.resize_to(1680, 1025)
  end
  scenario 'See Sample Page' do
    visit site
    page.save_screenshot 'result/screenshot.png', full: true
    expect(page).to have_content 'Thank you for using nginx.'
  end
end
