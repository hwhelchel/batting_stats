class BattingStatsApp
  class CareerPerformance

    attr_reader :years

    def initialize performances
      @years = {}

      performances.each do |perf|
        @years[:"#{perf.year}"] = perf
      end
    end

    def year date
      years[:"#{date}"]
    end

    def batting_average start, finish=nil
      return unless enough_at_bats? start, finish
      return year(start).batting_average unless finish
      average_over_range :hits, :at_bats, start..finish
    end

    def slugging_percentage start, finish=nil
      return year(start).slugging_percentage unless finish
      average_over_range :total_bases, :at_bats, start..finish

      total = (start..finish).reduce({total_bases: 0, at_bats: 0}) do |total, date|
        total[:total_bases] += year(date).total_bases
        total[:at_bats] += year(date).at_bats
      end

      total[:total_bases] / total[:at_bats]
    end


    def enough_at_bats? start, finish=nil
      unless finish
        at_bats = year(start).at_bats
      else
        at_bats = total_at_bats start..finish
      end
      at_bats >= 200 ? true : false
    end

    def total_at_bats period
      period.reduce(0) {|sum, date| sum += year(date).at_bats }
    end

    private

    def average_over_range numerator, denominator, range
      total = range.reduce({numerator: 0, denominator: 0}) do |acc, date|
        acc[:numerator] += year(date).send(numerator)
        acc[:denominator] += year(date).send(denominator)
      end

      total[:numerator] / total[:denominator]
    end

  end
end