# browser-test-ja

日本語環境に対応した Rspec/Capybara/PhantomJS ブラウザテスト環境です。
IPAゴシックを同梱しています。フォントのライセンスは IPA_Font_License_Agreement_v1.0.txt を参照。

## Quick Start

    # /path/to/spec/sample_spec.rb
    #
    feature 'test' do
      given(:site) { "https://google.com" }
      background do
        # Do something
      end
      scenario 'ログインする' do
        visit site
        page.save_screenshot 'result/screenshot.png', full: true
        expect(page).to have_content 'Google について'
      end
    end

最低限の設定の /work/spec/spec_helper および /work/.spec ファイルが予め配置してあるので、上記ファイルを作成したうえで、
下記コマンドでテストが実行できます。成功したら、 /path/to/result/ 以下にスクリーンショットが作成されます。

    docker run -v /path/to/spec:/work/spec/my -v /path/to/result:/work/result knaou/browser-test-ja


