class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # TODO
  # Créer une sorted_list (en hash) avec deux arguments : category et activity
  # Ceci va nous permettre de savoir qu'une activity appartient à telle category
  # Aller dans la vue et créer un bloc par category
  # Ajouter la class hidden aux category non concernées par la zone sélectionnée
  # Seules la category sans cette class apparaîtra dans le champ sélectionné

  def index
    if params[:query].present?
      @activities = Activity.search_by_title_description_category(params[:query])
    elsif params[:mine].present?
      all_activities
    else
      @activities = Activity.all
    end
  end

  def show
    set_activity
    # added additional code in order to show reviews star ratings and comments
    @reviews = @activity.reviews
    @average_rating = @reviews.average(:rating)
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
    redirect_to activities_path
  end

  def all_activities
    @user = current_user
    @activities = @user.activities
  end
end

private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :category, :localization, :price_per_day, :max_persons, :average_rating, :image)
  end
