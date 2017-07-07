require 'docking_station'

describe DockingStation do

  it { should respond_to(:release_bike)}
  it "initialises with a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "releases a working bike" do
    bike = double(:bike)
    subject.dock(bike, true)
    released_bike = subject.release_bike
    expect(released_bike.working?).to eq true
  end

  it "raises an error when releasing a bike that isn't there" do
    expect{subject.release_bike}.to raise_error("I do apologise, there are no bikes available")
  end

  it 'raises an error when attempting to dock a bike at a docking station already at full capacity' do
    subject.capacity.times { subject.dock(double(:bike), true) }
    expect{subject.dock(double(:bike), true)}.to raise_error("Very sorry, but this station is already full")
  end

  it { should respond_to(:dock).with(2).arguments }
  # it 'allows users to report a broken bike when docking it' do
  #   #subject.dock(Bike.new, false)
  #   #expect(subject.bikes.last.working?).to eq false
  # end

  it 'should not release broken bikes' do
    subject.dock(double(:bike), false)
    expect{subject.release_bike}.to raise_error("Sorry, bike is broken, cannot release")
  end

end
