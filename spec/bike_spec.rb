require 'bike'
describe Bike do
  it { should respond_to(:working?)}

  it 'can be reported broken' do
    subject.report_broken
    expect(subject.working?).to eq false
  end
end
