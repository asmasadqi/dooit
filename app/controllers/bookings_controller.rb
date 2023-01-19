class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update]

  # user_bookings GET    /users/:user_id/bookings(.:format)
  def index
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
  end

  # new_activity_booking GET    /activities/:activity_id/bookings/new(.:format)
  def new
    @booking = Booking.new
  end

  # activity_bookings POST   /activities/:activity_id/bookings(.:format)
  def create
    @booking = Booking.new(booking_params) #create a new booking from the filled form
    @activity = Activity.find(params[:activity_id]) #find the activity from the params
    @booking.activity = @activity #associate the activity to the created booking
    if @booking.save
      redirect_to activity_path(@activity) #redirect to the activity page
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).params([:time_start, :time_end, :total_price])
  end
end
