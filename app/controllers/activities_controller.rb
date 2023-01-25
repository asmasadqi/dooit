class ActivitiesController < ApplicationController

  # TODO
  # Créer une sorted_list (en hash) avec deux arguments : category et activity
  # Ceci va nous permettre de savoir qu'une activity appartient à telle category
  # Aller dans la vue et créer un bloc par category
  # Ajouter la class hidden aux category non concernées par la zone sélectionnée
  # Seules la category sans cette class apparaîtra dans le champ sélectionné

  def index
    if params[:query].present?
      @activities = Activity.search_by_title_description_category(params[:query])
    else
      @activities = Activity.all
    end
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
