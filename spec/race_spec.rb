require 'rspec'
require './lib/candidate'
require './lib/race'

describe Race do
  it 'exists' do
    race = Race.new("Canadian Emperor")

    expect(race).to be_a Race
  end

  it 'can return the off being voted for' do
    race = Race.new("Canadian Emperor")

    expect(race.office).to eq("Canadian Emperor")
  end

  it 'starts without any candidates' do
    race = Race.new("Canadian Emperor")

    expect(race.candidates).to eq([])
  end

  describe '#register_candidate!' do
    it 'can add candidates to the race' do
      race = Race.new("Canadian Emperor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

      expect(race.candidates).to eq([candidate1])
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq([candidate1, candidate2])      
    end
  end
end
