require_relative 'bike'
require 'pry'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("I do apologise, there are no bikes available") if empty?
    @bikes.pop
  end

  def dock bike
    fail("Very sorry, but this station is already full") if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end

end
