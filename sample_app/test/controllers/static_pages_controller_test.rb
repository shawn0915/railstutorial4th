require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
=begin
  为了测试首页，向StaticPages 控制器中home 动作对应的
URL 发起GET 请求，确认得到的是表示成功的响应码。
=end
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end
