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

      expect(election.add_race(race1)).to eq([race1])
      expect(election.add_race(race2)).to eq([race1, race2])
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

  describe '#vote_counts' do
    it 'returns hash of candidate names and their vote count' do
      election = Election.new('2022')
      race1 = Race.new("Virginia District 4 Representative")
      race2 = Race.new("Texas Governor")
      election.add_race(race1)
      election.add_race(race2)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      expect(election.vote_counts).to eq({
        "Diana D"=>4, "Roberto R"=>1, "Diego D"=>10, "Rita R"=>6, "Ida I"=>6
        })
    end
  end

  describe '#winners' do
    it 'returns an array of winners not including ties and open races' do
      election = Election.new('2022')
      race1 = Race.new("Virginia District 4 Representative")
      race2 = Race.new("Texas Governor")
      race3 = Race.new("Mayor of Denver")
      election.add_race(race1)
      election.add_race(race2)
      election.add_race(race3)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      candidate6 = race3.register_candidate!({name: "Jose M", party: :libertarian})
      candidate7 = race3.register_candidate!({name: "Scott P", party: :green})

      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}
      9.times {candidate6.vote_for!}
      9.times {candidate7.vote_for!}

      expect(election.winners).to eq([])
      race1.close!

      expect(election.winners).to eq([candidate1])
      race2.close!

      expect(election.winners).to eq([candidate1, candidate3])
      race3.close!

      expect(election.winners).to eq([candidate1, candidate3])
    end
  end
end
