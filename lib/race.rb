class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_details)
    candidate = Candidate.new(candidate_details)
    @candidates.push(candidate)
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      false
    else
      @candidates.max_by {|candidate| candidate.votes}
    end
  end
end
