# browser-test-ja

日本語環境に対応した Rspec/Capybara/Turnip with Headless Chromium ブラウザテスト環境です。
IPAゴシックを同梱しています。フォントのライセンスは fonts/IPA_Font_License_Agreement_v1.0.txt を参照。

## Quick Start

最低限の設定の /work/spec/spec_helper, /work/spec/turnip_helper, /work/.spec ファイルを予め配置してあるので、次の様に、specファイル/stepsファイル/features ファイルを配置するとテストが実行されます。

    docker run -v /path/to/spec:/work/spec/specs -v /path/to/steps:/work/spec/steps -v /path/to/features:/work/spec/features knaou/browser-test-ja


