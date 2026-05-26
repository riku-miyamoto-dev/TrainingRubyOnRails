require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "スキル一覧の表示" do
    get skills_url
    assert_response :success
  end

  test "新規作成ページの表示" do
    get new_skill_url
    assert_response :success
  end 

  test "スキル作成時にレコードが一件増えること" do
    assert_difference("Skill.count") do
      post skills_url, params: { 
        skill: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to skill_url(Skill.last)
  end  

  test "スキル編集ページを表示できるか" do
    @skill = skills(:language)
    get edit_skill_url(@skill)
    assert_response :success
  end

  test "スキルの詳細を表示できるか" do
    @skill = skills(:language)
    get skill_url(@skill)
    assert_response :success
  end

  test "情報を更新できるか" do
    @skill = skills(:language)
    patch skill_url(@skill), params: { 
      skill: { 
        name: "Ruby",
      } 
    }
    assert_redirected_to skill_url(@skill)
    @skill.reload
    assert_equal "Ruby", @skill.name
  end
  
  test "スキルを削除できるか" do
    skill = skills(:language)
    assert_difference("Skill.count", -1) do
      delete skill_url(skill)
    end
    assert_redirected_to skills_url
  end

end
