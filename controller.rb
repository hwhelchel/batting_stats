class BattingStatsApp
  class Controller

    def start
      most_improved_batting_averages 2009, 2010
      team_slugging_percentage 'OAK'
      triple_crown_winner 'AL', 2011
      triple_crown_winner 'AL', 2012
      triple_crown_winner 'NL', 2011
      triple_crown_winner 'NL', 2012
    end

    def most_improved_batting_averages start, finish
    end

    def team_slugging_percentage team_id
    end

    def triple_crown_winner league, year
    end

  end
end