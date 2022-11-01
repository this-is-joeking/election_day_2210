require 'rspec'
require './lib/candidate'
require './lib/race'

describe Race do
  it 'exists' do
    race = Race.new("Canadian Emperor")

    expect(race).to be_a Race
  end
end
