require 'test_helper'

class MicropostInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin_user)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'ol.microposts'
    assert_select 'div.pagination'
    # invalid post
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: '' } }
    end
    assert_select 'div#error_explanation'
    # valid post
    content = 'Valid test micropost submission.'
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: 'Valid test micropost submission.' } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    assert_select 'div.alert-success'
    # delete post
    assert_select 'a', test: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # as currently logged-in user, visit a different user's page and assert no 'delete' links
    get user_path(users(:frodo))
    assert_select 'a', text: 'delete', count: 0
  end

  test "home page sidebar microposts count" do
    log_in_as(@user)
    get root_path
    assert_match '35 posts', response.body
    other_user = users(:test_user)
    log_in_as(other_user)
    get root_path
    assert_match '0 posts', response.body
    other_user.microposts.create!(content: 'Lorem ipsum')
    get root_path
    assert_match '1 post', response.body
  end
  #  test "micropost sidebar count" do
  #   log_in_as(@user)
  #   get root_path
  #   microposts = @user.microposts.count
  #   assert_match "#{microposts} posts", response.body
  #   # User with zero microposts
  #   other_user = users(:test_user_2)
  #   log_in_as(other_user)
  #   get root_path
  #   assert_match "0 microposts", response.body
  #   other_user.microposts.create!(content: "A micropost")
  #   get root_path
  #   # assert_match '1 micropost', response.body
  # end
end
