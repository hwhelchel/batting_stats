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

    def batting_average start, finish=nil
      career.batting_average start, finish
    end

    def slugging_percentage start, finish=nil
      career.slugging_percentage start, finish
    end

    def year date
      career.year date
    end

  end
end