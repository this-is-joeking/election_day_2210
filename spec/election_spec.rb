require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  it 'exists' do
    election = Election.new('2022')

    expect(election).to be_a Election
  end

  it 'can return the year of the election' do
    election = Election.new('2022')

    expect(election.year).to eq('2022')
  end

  it 'starts with an empty array of races' do
    election = Election.new('2022')

    expect(election.races).to eq([])
  end

  describe '#add_race' do
    it 'can add races' do
      election = Election.new('2022')
      race1 = Race.new("Virginia District 4 Representative")
      race2 = Race.new("Texas Governor")
      election.add_race(race1)

      expect(election.races).to eq([race1])

      election.add_race(race2)

      expect(election.races).to eq([race1, race2])
    end
  end

  describe '#candidates' do
    it 'returns array of all candidates in the election' do
      election = Election.new('2022')
      race1 = Race.new("Virginia District 4 Representative")
      race2 = Race.new("Texas Governor")

      expect(election.candidates).to eq([])
      election.add_race(race1)
      election.add_race(race2)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

      expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4, candidate5])
    end
  end
end
