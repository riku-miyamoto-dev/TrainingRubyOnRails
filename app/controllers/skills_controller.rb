class SkillsController < ApplicationController

  def index
    add_breadcrumb('スキル一覧')
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    add_breadcrumb(@skill.name)
  end
end
