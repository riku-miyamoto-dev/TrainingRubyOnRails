require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "#index ユーザー一覧の表示ができること" do
    get users_url
    assert_response :success
  end
  test "#index 2ページの取得ができること" do
    get users_url(page: 2)
    assert_response :success
  end

  test "#index 名前検索結果の取得できること" do
    get users_url(query_name: "三")
    assert_response :success
  end

  test "#index 都道府県での絞り込み結果の取得ができること" do
    get users_url(query_prefecture: "北海道")
    assert_response :success
  end

  test "#index id昇順で並び替え結果の取得ができること" do
    get users_url(sort: "id 昇順")
    assert_response :success
  end

  test "#index 表示件数の変更結果取得ができること" do
    get users_url(per_page: 50)
    assert_response :success
  end

  test "#show ユーザー詳細ページを表示できること" do
    @user = users(:test_user)
    get user_url(@user)
    assert_response :success
  end

  test "#image ユーザー画像のアップロードができること" do
    @user = users(:test_user)
    get image_user_url(@user)
    assert_response :success
  end
end
