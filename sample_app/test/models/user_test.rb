require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @users = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar") # Chapter 6.3.2
  end

  test "should be valid" do
    assert @users.valid?
  end

  test "name should be present" do
    @users.name = "     "
    assert_not @users.valid?
  end

  test "email should be present" do
    @users.email = "     "
    assert_not @users.valid?
  end

  test "name should not be too long" do
    @users.name = "a" * 51
    assert_not @users.valid?
  end

  test "email should not be too long" do
    @users.email = "a" * 244 + "@example.com"
    assert_not @users.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @users.email = valid_address
      assert @users.valid?, "#{valid_address.inspect} should be valid"
    end
  end

=begin
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
=end

  test "email addresses should be unique" do
    # 唯一性
    duplicate_user = @users.dup
    # 不區分大小寫
    duplicate_user.email = @users.email.upcase
    @users.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @users.email = mixed_case_email
    @users.save
    assert_equal mixed_case_email.downcase, @users.reload.email
  end

  # password
  test "password should be present (nonblank)" do
    @users.password = @users.password_confirmation = " " * 6
    assert_not @users.valid?
  end

  # 密码的最短长度
  test "password should have a minimum length" do
    @users.password = @users.password_confirmation = "a" * 5
    assert_not @users.valid?
  end

  # 记忆摘要的值为nil 时，authenticated? 要返回false
  test "authenticated? should return false for a user with nil digest" do
    assert_not @users.authenticated?('')
  end

end
