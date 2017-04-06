require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
=begin
    # 无效提交
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {content: ""}}
    end
    assert_select 'div#error_explanation'
=end
    # 有效提交
    content = "This micropost really ties the room together"
    # picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: {micropost: {content: content}}
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 删除一篇微博
    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # 访问另一个用户的资料页面（没有删除链接）
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

=begin
  # 侧边栏中微博数量的测试模板
  test "micropost sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{FILL_IN} microposts", response.body
    # 这个用户没有发布微博
    other_user = users(:malory)
    log_in_as(other_user)
    get root_path
    assert_match "0 microposts", response.body
    other_user.microposts.create!(content: "A micropost")
    get root_path
    assert_match FILL_IN, response.body
  end
=end

end