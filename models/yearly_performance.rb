class BattingStatsApp 
  class YearlyPerformance

    attr_reader :year, :at_bats, :hits,
    :doubles, :triples, :home_runs,
    :runs_batted_in, :total_bases

    def initialize performance
      @year             = performance[:year]
      @at_bats          = performance[:at_bats]
      @hits             = performance[:hits]
      @doubles          = performance[:doubles]
      @triples          = performance[:triples]
      @home_runs        = performance[:home_runs]
      @runs_batted_in   = performance[:runs_batted_in]
      @total_bases      = calc_total_bases
    end

    def batting_average
      hits / at_bats
    end

    def slugging_percentage
      total_bases / at_bats
    end

    def calc_total_bases
      hits - doubles - triples - home_runs +
      doubles * 2 + triples * 3 + home_runs * 4
    end

  end
end