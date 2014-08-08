require_relative '../models/yearly_performance.rb'
require_relative '../models/career_performance.rb'
require_relative '../models/player.rb'
require_relative '../models/team.rb'
require_relative '../models/league.rb'
require_relative '../builder.rb'
require_relative '../controller.rb'

class BattingStatsApp

  def initialize files
    build_app(load_files(files))
    run
  end

  def build_app data
    Builder.new(data).build
  end

  def run
    Controller.new.start
  end

  def load_files files
    {
      demographics: File.open(files[:demographics], 'r').readlines,
      performance: File.open(files[:performance], 'r').readlines
    }
  end

end

files = {
  demographics: 'Master-small.csv',
  performance: 'Batting-07-12.csv'
}

BattingStatsApp.new(files)