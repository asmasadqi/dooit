class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def show
    set_activity
  end

  def new
    @activity = Activity.new
  end

  def create
    @user = current_user
    @activity = Activity.new(activity_params)
    @activity.user = @user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_activity
  end

  def update
    set_activity
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    set_activity
    @activity.destroy
  end
end

private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :category, :localization, :price_per_day, :max_persons, :average_rating)
  end
