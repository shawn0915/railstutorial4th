require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @users = users(:michael)
  end

  test "unsuccessful edit" do
    # expecting <"users/edit"> but rendering with <[]>
    # 登入测试用户
    log_in_as(@users)
    get edit_user_path(@users)
    assert_template 'users/edit'
    patch user_path(@users), params: {user: {name: "",
                                            email: "foo@invalid",
                                            password: "foo",
                                            password_confirmation: "bar"}}
    assert_template 'users/edit'
    # assert_select "div", "The form contains 4 errors"
  end

  test "successful edit" do
    log_in_as(@users)
    get edit_user_path(@users)
    assert_template 'users/edit'
    name = "shawn yan"
    email = "test@shawnyan.com"
    patch user_path(@users), params: {user: {name: name,
                                            email: email,
                                            password: "",
                                            password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @users
    @users.reload
    assert_equal name, @users.name
    assert_equal email, @users.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@users)
    log_in_as(@users)
    assert_redirected_to edit_user_url(@users)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@users), params: {user: {name: name,
                                            email: email,
                                            password: "",
                                            password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @users
    @users.reload
    assert_equal name, @users.name
    assert_equal email, @users.email
  end

end
