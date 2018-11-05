require_relative("scorecard.rb")
require_relative("match_summary.rb")

class Match
  attr_accessor :players,:current_players, :runs_left, :wickets_left, :balls_left, :overs_left
  def initialize(players, runs_left, wickets_left, balls_left)
    @players = players
    @current_players = [@players[0],@players[1]]
    @yet_to_play = @players[2..-1]
    @runs_left = runs_left
    @wickets_left = wickets_left
    @balls_left = balls_left
    @overs_left = (@balls_left/6)
  end
  def set_initial_strike()
    @current_players.first.change_strike()
  end
  def get_strike_player()
    @current_players.find { |player| player.is_on_strike? == true}
  end
  def get_match_summary()
    player_summaries = @players.collect { |player| player.summary()}
     if((@wickets_left == 0 or @balls_left == 0) and @runs_left > 0)
       MatchSummary.new("\nTeam lost by #{@runs_left} runs", player_summaries)
     elsif (@runs_left <= 0)
       MatchSummary.new("\nTeam won with #{@wickets_left} wickets and #{@balls_left} balls remaining",player_summaries)
     end
  end
  def carry_on()
    outcome = get_strike_player().play_ball()
    @balls_left -= 1
    get_current_status(outcome)
    if(outcome != "out")
      update_score(outcome)
      if(outcome % 2 != 0)
        change_strike_player()
      end
    else
      striker_out()
      set_up_new_player()
    end
    if(@balls_left % 6 == 0)
      change_strike_player()
      @overs_left = (@balls_left/6)
      get_status_before_over()
    end
  end
  def change_strike_player()
   @current_players.each {  |player| player.change_strike() }
  end
  def update_score(outcome)
    @runs_left -= outcome
  end
  def striker_out()
    @wickets_left -= 1
    get_strike_player.change_out_status()
    @current_players.delete( @current_players.find { |player| player.get_out_status? == true})

  end
  def set_up_new_player()
    if(@yet_to_play.length > 0)
      new_player = @yet_to_play.shift
      new_player.change_strike()
      @current_players.push(new_player)
    end
  end
  def should_continue?()
     (@balls_left > 0 and @wickets_left > 0 and @runs_left > 0)
  end
  def get_overs_left
    @overs_left
  end
  def get_current_status(outcome)
    ball_no = (6- (@balls_left % 6))/10.0
    Scorecard.new(@overs_left,nil,nil,ball_no, get_strike_player().get_ball_summary(outcome)).display_after_each_ball()
  end
  def get_status_before_over()
    if (@overs_left > 0)
      Scorecard.new(get_overs_left(), @runs_left, @wickets_left).display_before_over()
    end
  end
end