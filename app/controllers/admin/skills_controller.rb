class Admin::SkillsController < Admin::ApplicationController
before_action :add_users_index_breadcrumb
before_action :add_index_breadcrumb, only: %i[show new edit]
  def index
    @skills = Skill.all
    add_breadcrumb('スキル一覧')
  end

  def show
    @skill = Skill.find(params[:id])
    add_breadcrumb(@skill.name)
  end

  def new
    @skill = Skill.new
    add_breadcrumb('スキル新規作成')
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to [:admin, @skill]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    add_breadcrumb(@skill.name, admin_skill_path(@skill))
    add_breadcrumb('スキル編集')
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to [:admin, @skill]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to admin_skills_path
  end

  private
  def skill_params
    params.expect(skill: [
      :name 
    ])
  end
  def add_index_breadcrumb
    add_breadcrumb('スキル一覧', admin_skills_path)
  end
  def add_users_index_breadcrumb
    add_breadcrumb('ユーザー管理', admin_users_path)
  end
end
