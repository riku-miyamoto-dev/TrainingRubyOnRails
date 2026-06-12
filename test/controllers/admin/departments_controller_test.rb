require "test_helper"

class Admin::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "#index 部署一覧の表示ができること" do
    get admin_departments_url
    assert_response :success
  end

  test "#new 新規作成ページの表示ができること" do
    get new_admin_department_url
    assert_response :success
  end 

  test "#create 部署作成時にレコードが一件増えること" do
    assert_difference("Department.count") do
      post admin_departments_url, params: { 
        department: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to admin_department_url(Department.last)
  end  

  test "#edit 部署編集ページを表示できること" do
    @department = departments(:product1)
    get edit_admin_department_url(@department)
    assert_response :success
  end

  test "#show 部署の詳細を表示できること" do
    @department = departments(:product1)
    get admin_department_url(@department)
    assert_response :success
  end

  test "#update 情報を更新できること" do
    @department = departments(:product1)
    patch admin_department_url(@department), params: { 
      department: { 
        name: "PD1",
      } 
    }
    assert_redirected_to admin_department_url(@department)
    @department.reload
    assert_equal "PD1", @department.name
  end

    test "#delete 部署を削除できること" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete admin_user_url(user)
    end
    assert_redirected_to admin_users_url
  end

end
