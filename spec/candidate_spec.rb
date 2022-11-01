require 'rspec'
require './lib/candidate'

describe Candidate do
  it 'exists' do
    candidate = Candidate.new({name: "Diana D", party: :democrat})

    expect(candidate).to be_a(Candidate)
  end

  it 'returns the name' do
    candidate = Candidate.new({name: "Diana D", party: :democrat})

    expect(candidate.name).to eq("Diana D")
  end

  it 'returns the party' do
    candidate = Candidate.new({name: "Diana D", party: :democrat})

    expect(candidate.party).to eq(:democrat)
  end

  it 'starts with 0 votes' do
    candidate = Candidate.new({name: "Diana D", party: :democrat})

    expect(candidate.votes).to eq(0)
  end

  describe '#vote_for!' do
    it 'adds votes to the candidate' do
      diana = Candidate.new({name: "Diana D", party: :democrat})
      diana.vote_for!

      expect(diana.votes).to eq(1)
      diana.vote_for!
      diana.vote_for!

      expect(diana.votes).to eq(3)
    end
  end
end
