require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup data provided' do
    get signup_url
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'test@invalid', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
  end
end
