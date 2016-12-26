require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    count_before = User.count
    post users_path, params: {user: {name: "ValidUsername",
                                    email: "valid@valid.com" ,
                                    password: "goodpassword",
                                    password_confirmation: "goodpassword"}}
    count_after = User.count
    assert count_after == count_before + 1
  end
                                  
end