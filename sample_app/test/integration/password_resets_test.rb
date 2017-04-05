require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @users = users(:michael)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'

    # 电子邮件地址无效
    post password_resets_path, params: {password_reset: {email: ""}}
    assert_not flash.empty?
    assert_template 'password_resets/new'

    # 电子邮件地址有效
    post password_resets_path,
         params: {password_reset: {email: @users.email}}
    assert_not_equal @users.reset_digest, @users.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url

    # 密码重设表单
    user = assigns(:user)

=begin
    # 电子邮件地址错误
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url

    # 用户未激活
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)

    # 电子邮件地址正确，令牌不对
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_url

    # 电子邮件地址正确，令牌也对
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    # 页面中有name 属性、类型（隐藏）和电子邮件地址都正确的input 标签
    assert_select "input[name=email][type=hidden][value=?]", user.email

    # 密码和密码确认不匹配
    patch password_reset_path(user.reset_token),
          params: {email: user.email,
                   user: {password: "foobaz",
                          password_confirmation: "barquux"}}
    assert_select 'div#error_explanation'

    # 密码为空值
    patch password_reset_path(user.reset_token),
          params: {email: user.email,
                   user: {password: "",
                          password_confirmation: ""}}
    assert_select 'div#error_explanation'

    # 密码和密码确认有效
    patch password_reset_path(user.reset_token),
          params: {email: user.email,
                   user: {password: "foobaz",
                          password_confirmation: "foobaz"}}
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
=end
  end

=begin
  # 测试密码重设请求超时
  test "expired token" do
    get new_password_reset_path
    post password_resets_path,
         params: { password_reset: { email: @user.email } }
    @user = assigns(:user)
    @user.update_attribute(:reset_sent_at, 3.hours.ago)
    patch password_reset_path(@user.reset_token),
          params: { email: @user.email,
                    user: { password: "foobar",
                            password_confirmation: "foobar" } }
    assert_response :redirect
    follow_redirect!
    assert_match /FILL_IN/i, response.body
  end
=end
end
