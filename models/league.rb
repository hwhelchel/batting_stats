class BattingStatsApp
  class League

    attr_reader :name, :teams

    def initialize config
      @name  = config[:name]
      @teams = config[:teams]
    end

    def triple_crown_winner year
      contenders =

      [
        highest_batting_average(year),
        most_home_runs(year),
        most_runs_batted_in(year)
      ]

      contenders.uniq.length == 1 ? contenders[0] : nil
    end

    def players
      teams.map { |team| team.players }.flatten
    end

    def highest_batting_average date
      top = players[0]
      players[1..-1].each do |p|
        top = p.year(date).batting_average > top.batting_average ? player : top
      end
      top
    end

    def most_home_runs date
      top = players[0]
      players[1..-1].each do |p|
        top = p.year(date).home_runs > top.home_runs ? player : top
      end
      top
    end

    def most_runs_batted_in date
      top = players[0]
      players[1..-1].each do |p|
        top = p.year(date).runs_batted_in > top.runs_batted_in ? player : top
      end
      top
      # highest :runs_batted_in, date
    end

    # private

    # def highest category, date
    #   top = players[0]
    #   players[1..-1].each do |p|
    #     top = p.year(date).send(category) > top.year(date).send(category) ? player : top
    #   end
    #   top
    # end

  end
end