class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update]
  before_action :set_activity, only: %i[new create]

  # user_bookings GET    /users/:user_id/bookings(.:format)
  def index
    @user = current_user
    @bookings = @user.bookings
  end

  # new_activity_booking GET    /activities/:activity_id/bookings/new(.:format)
  def new
    @booking = Booking.new
  end

  # activity_bookings POST   /activities/:activity_id/bookings(.:format)
  def create
    @user = current_user
    @booking = Booking.new(booking_params) #create a new booking from the filled form
    @booking.activity = @activity #associate the activity to the created booking
    number_days = 1 + (@booking.time_end.day - @booking.time_start.day) # calculate the number of days selected with the picker
    @booking.total_price = number_days * @activity.price_per_day # total price is not part of params => number of days * price per day
    @booking.user = @user # associate user to the created booking
    if @booking.save
      redirect_to user_bookings_path(@user) #redirect to the booking index page
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit_booking GET    /bookings/:id/edit(.:format)
  def edit
  end

  # booking PATCH or PUT /bookings/:id(.:format)
  def update
    if @booking.update(booking_params)
      redirect_to user_bookings(@booking.user_id), notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit([:time_start, :time_end])
  end
end
