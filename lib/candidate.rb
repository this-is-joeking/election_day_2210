class Candidate
  attr_reader :name,
              :party
              
  def initialize(candidate_details)
    @name = candidate_details[:name]
    @party = candidate_details[:party]
  end
end
