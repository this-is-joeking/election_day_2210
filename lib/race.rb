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

  def tie?
    if open?
      false
    else
      top2 = @candidates.max_by(2) {|candidate| candidate.votes}
      top2[0].votes == top2[1].votes
    end
  end
end
