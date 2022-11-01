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
end
