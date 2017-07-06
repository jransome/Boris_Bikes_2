require 'docking_station'

describe DockingStation do
  # it 'responds to release_bike method' do
  #   expect(subject).to respond_to(:release_bike)
#  it { is_expected.to respond_to(:release_bike)}
  it { should respond_to(:release_bike)}

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
    subject.dock(Bike.new)
    expect{subject.dock(Bike.new)}.to raise_error("Very sorry, but this station is already full")
  end

end
