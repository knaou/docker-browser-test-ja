Feature: Test
  @tests
  Scenario: Sample for nginx sample page
    When "http://nginx/"にアクセス
    Then "Thank you for using nginx."が含まれる

