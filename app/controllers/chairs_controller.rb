class ChairsController < ApplicationController
  def fetch_time_slots
    @chair = Chair.find(params[:id])
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @time_slots = TimeSlot.where(chair: @chair).select do |slot|
      slot.start_time.year == @year && slot.start_time.month == @month && slot.start_time.day == @day
    end
    respond_to do |format|
      format.json { render json: @time_slots }
      format.html { render template: false }
      format.js { render template: 'fetch_time_slots.js.erb' }
    end
  end
end
