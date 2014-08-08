class BattingStatsApp
  class Team

    attr_reader :players, :team_id

    def initialize config
      @players = config[:players]
      @team_id = config[:team_id]
    end

    def slugging_averages
      players.map { |player| player.slugging_average }
    end

  end
end