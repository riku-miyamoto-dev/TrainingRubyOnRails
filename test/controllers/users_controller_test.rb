require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "#index ユーザー一覧の取得が成功すること" do
    get users_url
    assert_response :success
  end

  test "#new ユーザー登録ページの取得が成功すること" do
    get new_user_url
    assert_response :success
  end

  test "#post ユーザーの新規レコード作成が成功すること" do
    assert_difference("User.count") do
      post users_url, params: { user: { 
        name: "田中 純三郎",
        birthday: "2020-05-12",
        building: "グランドタワ",
        city: "新宿区",
        email: "tanaka@jun.san",
        furigana: "タナカジュンサンロウ",
        gender: "male",
        phone: "001-2888-0001",
        post_number: "111-2222",
        prefecture: "東京都",
        street_address: "1-2-10",
        tel: "0550-01-2222",
        town: "新宿区",
        department_id: 1,
        skill_ids: [skills(:language).id]
        } 
      }
    end
    assert_redirected_to user_url(User.last)
  end
  

  test "#show ユーザーの詳細ページ取得が成功すること" do
    user = users(:test_user)
    get user_url(user)
    assert_response :success
  end

  test "#edit ユーザー情報の編集ページの取得が成功すること" do
    user = users(:test_user)
    get edit_user_url(user)
    assert_response :success
  end

  test "#update ユーザー情報のアップデートが成功すること" do
    user = users(:test_user)
    updated_user = User.new(
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
      town: "新宿区新宿区3丁目" ,
      skill_ids: [skills(:english).id]
      
      )
    patch user_url(user), params: {user: updated_user.attributes}
    assert_redirected_to user_url(user)
    user.reload
    assert_equal updated_user.name, user.name
    assert_equal updated_user.furigana, user.furigana
    assert_equal updated_user.gender, user.gender
    assert_equal updated_user.tel, user.tel
    assert_equal updated_user.phone, user.phone
    assert_equal updated_user.email, user.email
    assert_equal updated_user.post_number, user.post_number
    assert_equal updated_user.prefecture, user.prefecture
    assert_equal updated_user.city, user.city
    assert_equal updated_user.town, user.town
    assert_equal updated_user.street_address, user.street_address
    assert_equal updated_user.building, user.building
    assert_equal Date.new(1991, 11, 11), user.birthday
  end

  test "#delete ユーザー情報の削除が成功すること" do
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
