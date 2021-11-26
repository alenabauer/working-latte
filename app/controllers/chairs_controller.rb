class ChairsController < ApplicationController
  def fetch_time_slots
    @chair = Chair.find(params[:id])
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
    # @time_slots = TimeSlot.where(chair: @chair).select do |slot|
    #   slot.start_time.year == @year && slot.start_time.month == @month && slot.start_time.day == @day
    # end
    binding.pry
    @time_slots.as_json
    render layout: false
  end
end
