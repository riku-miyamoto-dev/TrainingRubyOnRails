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
        name: "田中 純三郎",
        birthday: "2022-05-12",
        building: "グランドタワー",
        city: "新宿区",
        email: "testmail@expext",
        furigana: "タナカジュンサンロウ",
        gender: "male",
        phone: "001-2222-0001",
        post_number: "111-2222",
        prefecture: "東京都",
        street_address: "1-2-10",
        tel: "00-0000-2222",
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
    patch user_url(user), params: { user: {
      name: "田中 純二郎",
      birthday: "1991-11-11",
      building: "グランドツリー",
      city: "新宿区西新宿",
      email: "test@example.rb",
      furigana: "タナカジュンジロウ",
      gender: "female",
      phone: "001-1111-0001",
      post_number: "111-1111",
      prefecture: "京都府",
      street_address: "1-2-11",
      tel: "00-0000-1111",
      town: "新宿区新宿区3丁目" } }
    assert_redirected_to user_url(user)
    user.reload
    assert_equal "田中 純二郎", user.name
    assert_equal "タナカジュンジロウ", user.furigana
    assert_equal "female", user.gender
    assert_equal "00-0000-1111", user.tel
    assert_equal "001-1111-0001", user.phone
    assert_equal "test@example.rb", user.email
    assert_equal "111-1111", user.post_number
    assert_equal "京都府", user.prefecture
    assert_equal "新宿区西新宿", user.city
    assert_equal "新宿区新宿区3丁目", user.town
    assert_equal "1-2-11", user.street_address
    assert_equal "グランドツリー", user.building
    assert_equal Date.new(1991, 11, 11), user.birthday
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
