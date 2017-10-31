class GoalsController < ApplicationController
  before_action :require_login

  def index
    redirect_to user_url(current_user)
  end

  def create
    goal = Goal.new(goal_params)
  end

  private

  def goal_params
  end
end
