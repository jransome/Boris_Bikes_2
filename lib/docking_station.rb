require_relative 'bike'
require 'pry'

class DockingStation
  attr_reader :bike

  def release_bike
    if @bike == nil
      fail("I do apologise, there are no bikes available")
    else
      @bike
    end
  end

  def dock bike
    #binding.pry
    #@bike = nil
    fail("Very sorry, but this station is already full") if @bike
    @bike = bike
  end

end
