class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
=begin
  active_relationship.follower 获取关注我的用户
  active_relationship.followed 获取我关注的用户
  user.active_relationships.create(followed_id:
                                       other_user.id)
  创建user 发起的主动关系
  user.active_relationships.create!(followed_id:
                                        other_user.id)
  创建user 发起的主动关系（失败时抛出异常）
  user.active_relationships.build(followed_id:
                                      other_user.id)
  构建user 发起的主动关系对象
=end

  # rails 5 之后，不加该验证亦可
  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
