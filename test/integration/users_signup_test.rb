require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup data provided' do
    get signup_url
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'test@invalid', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid user signup' do
    get signup_url
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Bobby Bananas', email: 'bobby@bananas.com', password: 'abcd1234', password_confirmation: 'abcd1234' } }
    end
    follow_redirect!
    # assert_template 'users/show'
    # assert_select 'div.alert'
    # assert_select 'h1', 'Bobby Bananas'
    # assert_select 'footer.footer'
  end
end
