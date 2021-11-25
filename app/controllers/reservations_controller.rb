class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.chair = Chair.find(params[:chair_id])
    if @reservation.save
      create_reservation_time_slots
      redirect_to cafe_path(@reservation.chair.cafe), notice: 'Your reservation was successful.'
    else
      # render
    end
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
