require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "#index スキル一覧の取得が成功すること" do
    get skills_url
    assert_response :success
  end

  test "#new スキル新規作成ページの取得が成功すること" do
    get new_skill_url
    assert_response :success
  end 

  test "#post スキルのレコードが増加すること" do
    assert_difference("Skill.count") do
      post skills_url, params: { 
        skill: { 
          name: "PD1",
        } 
      }
    end
    assert_redirected_to skill_url(Skill.last)
  end  

  test "#edit スキル編集ページの取得が成功すること" do
    @skill = skills(:language)
    get edit_skill_url(@skill)
    assert_response :success
  end

  test "#show スキル詳細ページの取得が成功すること" do
    @skill = skills(:language)
    get skill_url(@skill)
    assert_response :success
  end

  test "#update スキルの更新が成功すること" do
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
  
  test "#delete スキルの削除が成功すること" do
    skill = skills(:language)
    assert_difference("Skill.count", -1) do
      delete skill_url(skill)
    end
    assert_redirected_to skills_url
  end

end
