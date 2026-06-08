require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "スキル一覧の表示" do
    get skills_url
    assert_response :success
  end

  test "スキルの詳細を表示できるか" do
    @skill = skills(:language)
    get skill_url(@skill)
    assert_response :success
  end
end
