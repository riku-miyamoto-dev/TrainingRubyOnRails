class SkillsController < ApplicationController
  before_action :add_index_breadcrumb, only: %i[show]

  def index
    add_breadcrumb('スキル一覧')
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    add_breadcrumb(@skill.name)
  end

  private
  def add_index_breadcrumb
    add_breadcrumb('スキル一覧', skills_url)
  end
end
