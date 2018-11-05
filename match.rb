class Match
  attr_accessor :players,:current_players, :runs_left, :wickets_left, :balls_left
  def initialize(players, runs_left, wickets_left, balls_left)
    @players = players
    @current_players = [@players[0],@players[1]]
    @yet_to_play = @players[2..-1]
    @runs_left = runs_left
    @wickets_left = wickets_left
    @balls_left = balls_left
  end
  def set_initial_strike()
    @current_players.first.change_strike()
  end
  def get_strike_player()
    @current_players.find { |player| player.is_on_strike? == true}
  end

  def carry_on()
    outcome = get_strike_player().play_ball()
    @balls_left -= 1
    if(outcome != "out")
      update_score(outcome)
      if(outcome % 2 != 0)
        change_strike_player()
      end
    else
      striker_out()
      set_up_new_player()
    end
    puts @balls_left
    if(@balls_left % 6 == 0)
      change_strike_player()
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
    new_player = @yet_to_play.shift
    new_player.change_strike()
    @current_players.push(new_player)
  end
end