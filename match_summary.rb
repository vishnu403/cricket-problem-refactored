class MatchSummary
  attr_accessor :match_result, :player_summaries
  def initialize(match_result, player_summaries)
    @match_result = match_result
    @player_summaries = player_summaries
  end
  def display
    puts @match_result
    puts "\n"
    @player_summaries.map {|summary| puts summary}
  end
end