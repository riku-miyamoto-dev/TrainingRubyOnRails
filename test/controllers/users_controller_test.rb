require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "ユーザー一覧の表示" do
    get users_url
    assert_response :success
  end

  test "ユーザーを新規作成するページの表示" do
    get new_user_url
    assert_response :success
  end

  test "ユーザーを作成時にレコードが一件増えること" do
    assert_difference("User.count") do
      post users_url, params: { user: { 
        name: "田中 純一郎",
        birthday: "2022-05-12",
        building: "グランドタワー",
        city: "新宿区",
        email: "test@expext",
        furigana: "タナカジュンイチロウ",
        gender: "male",
        phone: "001-1111-0001",
        post_number: "111-1111",
        prefecture: "東京都",
        street_address: "1-1-10",
        tel: "00-0000-1111",
        town: "新宿区"
        } 
      }
    end
    assert_redirected_to user_url(User.last)
  end
  

  test "ユーザーの詳細を表示できるか" do
    user = users(:test_user)
    get user_url(user)
    assert_response :success
  end

  test "ユーザー編集ページを表示できるか" do
    user = users(:test_user)
    get edit_user_url(user)
    assert_response :success
  end

  test "ユーザー情報を更新できるか" do
    user = users(:test_user)
    patch user_url(user), params: { user: { name: "updated_user" } }
    assert_redirected_to user_url(user)
    user.reload
    assert_equal "updated_user", user.name
  end

  test "ユーザーを削除できるか" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete user_url(user)
    end
    assert_redirected_to users_url
  end

#factory
#   test "ユーザー一覧の表示" do
#     get users_url
#     assert_response :success
#   end

#   test "ユーザーを新規作成するページの表示" do
#     get new_user_url
#     assert_response :success
#   end

#   test "ユーザーを作成時にレコードが一件増えること" do
#     assert_difference("User.count") do
#       post users_url, params: { user: { name: "test_user" } }
#     end
#     assert_redirected_to user_url(User.last)
#   end

#   test "ユーザー編集ページを表示できるか var Factory" do
#     user = create(:user)
#     get edit_user_url(user)
#     assert_response :success
#   end


#   test "ユーザー編集ページを表示できるか" do
#      user = create(:user)
#     get edit_user_url(user)
#     assert_response :success
#   end

#   test "ユーザー情報を更新できるか" do
#     user = create(:user)
#     patch user_url(user), params: { user: { name: "updated_user" } }
#     assert_redirected_to user_url(user)
#     user.reload
#     assert_equal "updated_user", user.name
#   end

#   test "ユーザーを削除できるか" do
#     user = create(:user)
#     assert_difference("User.count", -1) do
#       delete user_url(user)
#     end
#     assert_redirected_to users_url
#   end
end
