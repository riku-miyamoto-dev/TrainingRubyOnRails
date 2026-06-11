require "test_helper"

class Admin::SkillsControllerTest < ActionDispatch::IntegrationTest
  test "#index スキル一覧の表示ができること" do
    get admin_skills_url
    assert_response :success
  end

  test "#new 新規作成ページの表示ができること" do
    get new_admin_skill_url
    assert_response :success
  end 

  test "#create スキル作成時にレコードが一件増えること" do
    assert_difference("Skill.count") do
      post admin_skills_url, params: { 
        skill: { 
          name: "世界遺産検定",
        } 
      }
    end
    assert_redirected_to admin_skill_url(Skill.last)
  end  



  test "#edit スキル編集ページを表示できること" do
    @skill = skills(:language)
    get edit_admin_skill_url(@skill)
    assert_response :success
  end

  test "#show スキルの詳細を表示できること" do
    @skill = skills(:language)
    get skill_url(@skill)
    assert_response :success
  end

  test "#update 情報を更新できること" do
    @skill = skills(:language)
    patch admin_skill_url(@skill), params: { 
      skill: { 
        name: "Ruby",
      } 
    }
    assert_redirected_to admin_skill_url(@skill)
    @skill.reload
    assert_equal "Ruby", @skill.name
  end
  
  test "#delete スキルを削除できること" do
    skill = skills(:language)
    assert_difference("Skill.count", -1) do
      delete admin_skill_url(skill)
    end
    assert_redirected_to admin_skills_url
  end

end
