class LongGoalsController < ApplicationController

  def index
    if @current_user
    @long_goals = LongGoal.where(user_id: @current_user.id)
  else
    redirect_to '/users/new'
  end
  end

  def show
    @long_goal = LongGoal.find(params[:id])
  end

  def new
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.new
  end

  def create
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.new(long_goal_params)
    if @long_goal.save
      flash[:notice] = "Long-term goal was successfully created."
    redirect_to @long_goal
    else
      render :new
      flash[:alert] = "Must have a goal"
    end
  end


  def edit
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:id])
  end

  def update
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:id])
    @long_goal.update(long_goal_params)
    redirect_to @long_goal
  end

  def destroy
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:id])
    @long_goal.destroy
    redirect_to @long_goal
  end
  private

  def long_goal_params
    params.require(:long_goal).permit(:goal, :duedate, :image_url, :user_id)
  end

end
