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
end
