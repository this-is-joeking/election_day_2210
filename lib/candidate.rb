class Candidate
  attr_reader :name
  def initialize(candidate_details)
    @name = candidate_details[:name]
  end
end
