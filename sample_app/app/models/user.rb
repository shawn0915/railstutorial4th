class User < ApplicationRecord
  # 约定：模式为单数，DB表名为复数

  attr_accessor :remember_token

  # 转换小写
  # before_save {self.email = email.downcase}
  before_save { email.downcase! }

  # 存在性验证
  validates :name, presence: true, length: {maximum: 50}

=begin
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
=end
  # 不允許電子郵件地址中有多個點號
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: {minimum: 6}

  # 返回指定字符串的哈希摘要
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 返回一个随机令牌
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    # 赋值
    # self.remember_token = ...
    # 为持久保存回话，在数据库中记住用户
    self.remember_token = User.new_token
    # update_attribute(:remember_digest, ...)
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 如果指定的令牌和摘要匹配，返回true
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # 忘记用户
  def forget
    update_attribute(:remember_digest, nil)
  end

end
