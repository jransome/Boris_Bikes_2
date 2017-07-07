require 'docking_station'

describe DockingStation do

  it { should respond_to(:release_bike)}
  it "initialises with a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "releases a working bike" do
    bike = Bike.new
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike.working?).to eq true
  end

  it "raises an error when releasing a bike that isn't there" do
    expect{subject.release_bike}.to raise_error("I do apologise, there are no bikes available")
  end

  it 'raises an error when attempting to dock a bike at a docking station already at full capacity' do
    subject.capacity.times { subject.dock(Bike.new) }
    expect{subject.dock(Bike.new)}.to raise_error("Very sorry, but this station is already full")
  end

end
