# frozen_string_literal: true

class SitemapsController < ApplicationController
  def show
    @departments = Department.all
    @skills = Skill.all
    @users = User.all
  end
end
