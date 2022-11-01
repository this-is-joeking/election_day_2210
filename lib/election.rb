class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.map { |race| race.candidates }.flatten
  end

  def vote_counts
    candidates.map {|candidate| [candidate.name, candidate.votes]}.to_h
  end

  def winners
    open_races = @races.select {|race| !race.open? && !race.tie?}
    open_races.map { |race| race.winner }
  end
end
