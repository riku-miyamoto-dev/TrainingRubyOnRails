require "test_helper"

class Admin::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "部署一覧の表示" do
    get admin_departments_url
    assert_response :success
  end

  test "新規作成ページの表示" do
    get new_admin_department_url
    assert_response :success
  end 

  test "部署作成時にレコードが一件増えること" do
    assert_difference("Department.count") do
      post admin_departments_url, params: { 
        department: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to admin_department_url(Department.last)
  end  

  test "部署編集ページを表示できるか" do
    @department = departments(:product1)
    get edit_admin_department_url(@department)
    assert_response :success
  end

  test "部署の詳細を表示できるか" do
    @department = departments(:product1)
    get admin_department_url(@department)
    assert_response :success
  end

  test "情報を更新できるか" do
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

    test "部署を削除できるか" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete admin_user_url(user)
    end
    assert_redirected_to admin_users_url
  end

end
