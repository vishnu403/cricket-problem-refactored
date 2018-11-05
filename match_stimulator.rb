class MatchStimulator
  attr_accessor :match,
  def initialize()
     virat = Player.new("virat", virat_probability)
     dhoni = Player.new("dhoni", dhoni_probability)
     bumrah = Player.new("bumrah", bumrah_probability)
     nehra  = Player.new("nehra", nehra_probability)
     players = [virat, dhoni, bumrah, nehra]
     @match = Match.new(players,40,3,24)
  end
  def start_match()
     @match.set_initial_strike()

  end

end