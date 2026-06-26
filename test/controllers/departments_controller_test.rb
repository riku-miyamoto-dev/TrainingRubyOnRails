# frozen_string_literal: true

require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test '#index 部署一覧の表示できること' do
    get departments_url
    assert_response :success
  end

  test '#show 部署の詳細を表示できること' do
    @department = departments(:product1)
    get department_url(@department)
    assert_response :success
  end
end
