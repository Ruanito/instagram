require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should redirect to users_path when create a new session" do
    user = build_user
    post login_path, params: {email: user.email, password: user.password}
    assert_redirected_to users_path
  end

  test "should redirect to login_path when cannot create a new session" do
    post login_path, params: {email: 'fake@fake.com', password: 'fake'}
    assert_redirected_to login_path
  end

  test "should redirect to login_path when destroy de session" do
    delete logout_path
    assert_redirected_to login_path
  end

  private
    def build_user
      user = User.new(email: 'fake@fake', password: 'fake')
      user.save
      user
    end
end
