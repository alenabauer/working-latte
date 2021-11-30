class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.chair = Chair.find(params[:chair_id])
    @time_slots = []
    params[:reservation][:time_slot_ids].reject { |id| id == "" }.each do |id|
      @time_slots << TimeSlot.find(id)
    end
    @reservation.date = Date.new(@time_slots.first.start_time.year, @time_slots.first.start_time.month, @time_slots.first.start_time.day )
    @reservation.start_time = Time.new(@time_slots.first.start_time.year, @time_slots.first.start_time.month, @time_slots.first.start_time.day, @time_slots.first.start_time.hour, 0, 0)
    @reservation.end_time = Time.new(@time_slots.last.start_time.year, @time_slots.last.start_time.month, @time_slots.last.start_time.day, @time_slots.last.start_time.hour + 1, 0, 0)
    if @reservation.save
      create_reservation_time_slots
      redirect_to dashboard_path, notice: 'Your reservation was successful.'
    else
      # render
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to dashboard_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time_slots)
  end

  def create_reservation_time_slots
    params[:reservation][:time_slot_ids].reject { |id| id == "" }.each do |id|
      ReservationTimeSlot.create(time_slot_id: id, reservation: @reservation)
    end
  end
end
