class ShortGoalsController < ApplicationController
  def show
    @short_goal = ShortGoal.find(params[:id])
    @long_goal = @short_goal.long_goal
  end

  def new
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:long_goal_id])
    @short_goal = ShortGoal.new
    # you could also @short_goal.new(long_goal: long_goal.id) and then in your short_goal new view use only @short_goal in your form_for. not necessarily any better but just another way to do it!
  end

  def create
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:long_goal_id])
    @short_goal = @long_goal.short_goals.new(short_goal_params)
    @short_goal.user = @current_user
    @short_goal.save!
    redirect_to @long_goal
    # can see that you are dealing 'fluently' with your models/resources here!
  end

  def edit
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:long_goal_id])
    @short_goal = ShortGoal.find(params[:id])
  end

  def update
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:long_goal_id])
    @short_goal = ShortGoal.find(params[:id])
    @short_goal.update(short_goal_params)
    redirect_to @long_goal
  end

  def destroy
    redirect_to root_path unless @current_user
    @long_goal = LongGoal.find(params[:id])
    @short_goal = ShortGoal.find(params[:id])
    @short_goal.destroy
    redirect_to @long_goal
  end

  private

  def short_goal_params
    params.require(:short_goal).permit(:goal, :scheduled_date, :location)
  end


end
