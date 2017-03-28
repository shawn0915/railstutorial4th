require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: {
          user: {
              name: "",
              email: "user@invalid",
              password: "foo",
              password_confirmation: "bar"

          }
      }

      assert_template 'users/new'
      # assert_select 'div#<CSS id for error explanation>'
      # assert_select 'div.<CSS class for field with error>'
      assert_select 'div#error_explanation'
      assert_select 'div.field_with_errors'
    end

  end

  test "valid signup information with account activation" do
    get signup_path

    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "Example User",
                                       email: "user@example.com",
                                       password: "password",
                                       password_confirmation: "password"}}
    end
    # assert_equal 1, ActionMailer::Base.deliveries.size

    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in? # 注册后登入
  end


end
