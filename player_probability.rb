require "pickup"
class PlayerProbability
  attr_accessor :dot , :single, :double, :triple, :four,:five, :six, :out
  def initialize(dot,single,double,triple,four,five,six,out)
    @probability = {
        0 => dot,
        1 => single,
        2 => double,
        3 => triple,
        4 => four,
        5 => five,
        6 => six,
        "out" => out,
    }
  end
  def get_outcome()
    pickup = Pickup.new(@probability)
    pickup.pick
  end
end