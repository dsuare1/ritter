require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user)
  end

  test 'update profile failure invalid info provided' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: '',
                                              email: 'invalid@foocom',
                                              password: 'foo',
                                              password_confirmation: 'bar' } }
   assert_template 'users/edit'
    assert_select 'div.alert', 'The form contains 4 errors.'
  end

  test 'successful edit of user information' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'Foo Bar'
    email = 'foo@bar.com'
    patch user_path(@user), params: { user: { name: name,
                                             email: email,
                                             password: '',
                                             password_confirmation: '' } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end