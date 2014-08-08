class BattingStatsApp
  class Builder

    attr_reader :demographics, :performance

    def initialize demographics, performance
      @demographics = demographics
      @performance = performance
    end

    def build demographics, performance
      build_yearly_performance
      build_career_performance
      build_players
      build_teams
      build_leagues
    end

    def build_yearly_performance
      performance[1..-1].each do |line|
        player, year, _1, _2, _3,
        at_bats, _4, hits, doubles, triples,
        home_runs, runs_batted_in, _5 = line.split(/\t/)
        data = {
          year: year,
          at_bats: at_bats,
          hits: hits,
          doubles: doubles,
          triples: triples,
          home_runs: home_runs,
          runs_batted_in: runs_batted_in
        }
        Performance.new(data)
      end
    end

    def build_career_performance
    end

    def build_players
    end
    
    def build_teams
    end

    def build_leagues
    end

  end
end