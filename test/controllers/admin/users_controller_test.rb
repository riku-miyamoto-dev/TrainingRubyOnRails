require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "#index ユーザー一覧の表示できること" do
    get admin_users_url
    assert_response :success
  end

  test "#new ユーザーを新規作成するページの表示できること" do
    get new_admin_user_url
    assert_response :success
  end

  test "#create ユーザーを作成時にレコードが一件増えること" do
    assert_difference("User.count") do
      post admin_users_url, params: { user: { 
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
        town: "新宿区",
        department_id: departments(:product1).id
        } 
      }
    end
    assert_redirected_to admin_user_url(User.last)
  end
  

  test "#show ユーザーの詳細を表示できること" do
    user = users(:test_user)
    get admin_user_url(user)
    assert_response :success
  end

  test "#edit ユーザー編集ページを表示できること" do
    user = users(:test_user)
    get edit_admin_user_url(user)
    assert_response :success
  end

  test "#update ユーザー情報を更新できるか" do
    user = users(:test_user)
    patch admin_user_url(user), params: { user: {
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
    assert_redirected_to admin_user_url(user)
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

  test "#delete ユーザーを削除できること" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete admin_user_url(user)
    end
    assert_redirected_to admin_users_url
  end
end