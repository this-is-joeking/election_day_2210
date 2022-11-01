class Candidate
  attr_reader :name,
              :party,
              :votes

  def initialize(candidate_details)
    @name = candidate_details[:name]
    @party = candidate_details[:party]
    @votes = 0
  end
end
