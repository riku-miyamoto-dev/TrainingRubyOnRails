require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "ユーザー一覧の表示" do
    get users_url
    assert_response :success
  end

  test "ユーザー詳細ページを表示できるか" do
    @user = users(:test_user)
    get user_url(@user)
    assert_response :success
  end
end