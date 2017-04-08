require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @users = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    # get users_new_url
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@users)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    # patch请求 => Users.update
    patch user_path(@users), params: {user: {name: @users.name,
                                             email: @users.email}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@users)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@users), params: {user: {name: @users.name,
                                             email: @users.email}}
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

=begin
  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
        user: {password: FILL_IN,
               password_confirmation: FILL_IN,
               admin: FILL_IN}}
    assert_not @other_user.FILL_IN.admin?
  end
=end

  # 确认了未授权的用户（非管理员）不能删除用户
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@users)
    end
    assert_redirected_to root_url
  end

  # 确认管理员点击删除链接后能成功删除用户
  test "should redirect destroy when logged in as a admin" do
    log_in_as(@users)
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
    assert_redirected_to users_path
  end

  # CodeList 14.24
  # 测试我关注的用户列表页面和关注我的用户列表页面的访问限制
  test "should redirect following when not logged in" do
    get following_user_path(@users)
    assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@users)
    assert_redirected_to login_url
  end

end
