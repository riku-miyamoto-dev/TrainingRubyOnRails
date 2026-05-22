require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "部署一覧の表示" do
    get departments_url
    assert_response :success
  end

  test "新規作成ページの表示" do
    get new_department_url
    assert_response :success
  end 

  test "部署作成時にレコードが一件増えること" do
    assert_difference("Department.count") do
      post departments_url, params: { 
        department: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to department_url(Department.last)
  end  

  test "部署編集ページを表示できるか" do
    @department = departments(:product1)
    get edit_department_url(@department)
    assert_response :success
  end

  test "部署の詳細を表示できるか" do
    @department = departments(:product1)
    get department_url(@department)
    assert_response :success
  end

  test "情報を更新できるか" do
    @department = departments(:product1)
    patch department_url(@department), params: { 
      department: { 
        name: "PD1",
      } 
    }
    assert_redirected_to department_url(@department)
    @department.reload
    assert_equal "PD1", @department.name
  end

    test "部署を削除できるか" do
    user = users(:test_user)
    assert_difference("User.count", -1) do
      delete user_url(user)
    end
    assert_redirected_to users_url
  end

end
