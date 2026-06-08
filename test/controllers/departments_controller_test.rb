require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "部署一覧の表示" do
    get departments_url
    assert_response :success
  end

  test "部署の詳細を表示できるか" do
    @department = departments(:product1)
    get department_url(@department)
    assert_response :success
  end
end