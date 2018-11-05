class Player
  private
  attr_accessor :name, :probability, :runs_scored, :balls_faced, :on_strike, :is_out
  public
  def initialize( name, probability)
    @name = name
    @probability = probability
    @runs_scored = 0
    @balls_faced = 0
    @on_strike = false
    @is_out = false
  end
  def play_ball()
    result = @probability.get_outcome()
    update_runs(result)
    result
  end
  def update_runs(result)
    if(result != "out")
      @runs_scored += result
      @balls_faced += 1
    else
      @balls_faced += 1
    end
  end
  def change_strike()
    @on_strike = !@on_strike
  end
  def get_runs()
    @runs_scored
  end
  def get_balls_faced()
    @balls_faced
  end
  def is_on_strike?()
    @on_strike
  end
  def change_out_status()
    @is_out = true
  end
  def get_out_status?()
    @is_out
  end
end