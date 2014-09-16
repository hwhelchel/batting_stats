class BattingStatsApp
  class Player

    attr_reader :career, :player_id, :birth_year,
    :first_name, :last_name

    def initialize demographics, career
      @career             = career
      @player_id          = demographics[:player_id]
      @birth_year         = demographics[:birth_year]
      @first_name         = demographics[:first_name]
      @last_name          = demographics[:last_name]
    end

    delegate [:batting_average, :slugging_percentage, :year] => :career

  end
end