require_relative 'bike'
require 'pry'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail("I do apologise, there are no bikes available") if empty?
    fail("Sorry, bike is broken, cannot release") unless @bikes.last.working?
    @bikes.pop
  end

  def dock(bike, working)
    fail("Very sorry, but this station is already full") if full?
    bike.working = working
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
