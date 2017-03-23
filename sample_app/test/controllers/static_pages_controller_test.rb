require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
=begin
  为了测试首页，向StaticPages 控制器中home 动作对应的
URL 发起GET 请求，确认得到的是表示成功的响应码。
=end

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  # root
  test "should get root" do
    # get static_pages_home_url
    get root_path
    assert_response :success
  end

  test "should get home" do
    # get static_pages_home_url
    get root_path
    assert_response :success
    # assert_select "title", "Home | #{@base_title}"
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    # get static_pages_help_url
    # get help_path
    get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    # get static_pages_about_url
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    # get static_pages_contact_url
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
