require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "#index 部署一覧の取得が成功すること" do
    get departments_url
    assert_response :success
  end

  test "#new 部署の作成ページ取得が成功すること" do
    get new_department_url
    assert_response :success
  end 

  test "#post 部署の作成が成功すること" do
    assert_difference("Department.count") do
      post departments_url, params: { 
        department: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to department_url(Department.last)
  end  

  test "#edit 部署の編集ページ取得が成功すること" do
    @department = departments(:pd1)
    get edit_department_url(@department)
    assert_response :success
  end

  test "#show 部署詳細ページの取得が成功すること" do
    @department = departments(:pd1)
    get department_url(@department)
    assert_response :success
  end

  test "#update 部署の情報更新が成功すること" do
    @department = departments(:pd1)
    patch department_url(@department), params: { 
      department: { 
        name: "PD1",
      } 
    }
    assert_redirected_to department_url(@department)
    @department.reload
    assert_equal "PD1", @department.name
  end

    test "#delete 部署の削除が成功すること" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete user_url(user)
    end
    assert_redirected_to users_url
  end

end
