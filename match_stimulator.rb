require_relative ("player.rb")
require_relative ("player_probability.rb")
require_relative ("match.rb")

class MatchStimulator
  attr_accessor :match
  def initialize()
    virat_probability = PlayerProbability.new(5,30,25,10,15,1,9,5)
    dhoni_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    bumrah_probability = PlayerProbability.new(20,30,15,5,10,1,4,20)
    nehra_probability = PlayerProbability.new(30,25,10,0,5,1,4,30)

     virat = Player.new("virat", virat_probability)
     dhoni = Player.new("dhoni", dhoni_probability)
     bumrah = Player.new("bumrah", bumrah_probability)
     nehra  = Player.new("nehra", nehra_probability)
     players = [virat, dhoni, bumrah, nehra]
     @match = Match.new(players,40,3,24)
  end
  def start_match()
     @match.set_initial_strike()
     @match.get_status_before_over()
     while (@match.should_continue?())
       @match.carry_on()
     end
     @match.get_match_summary().display()
  end
end

MatchStimulator.new().start_match()