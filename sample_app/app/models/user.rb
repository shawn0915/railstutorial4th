class User < ApplicationRecord
  # 约定：模式为单数，DB表名为复数

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
end
