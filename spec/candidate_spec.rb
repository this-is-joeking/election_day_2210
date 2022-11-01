require 'rspec'
require './lib/candidate'

describe Candidate do
  it 'exists' do
    candidate = Candidate.new

    expect(candidate).to be_a(Candidate)
  end
end
