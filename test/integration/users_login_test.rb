require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name: "Example User", email: "cladiu.cismaru94@gmail.com",
                     password: "Cacadeporc1", password_confirmation: "foobar")
  end
  
  test "flash should disappear after going to other page" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: "", password: ""} }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get home_path
    assert flash.empty?
  end
  
end
