require_relative ("../player.rb")
require_relative ("../player_probability.rb")


describe "player should play the ball according to its probability" do
  it "should return the outcome as dot as probability of dot is 100 %" do
    probability = PlayerProbability.new(100,0,0,0,0,0,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(0)
  end
  it "should return the outcome as single as probability of single is 100 %" do
    probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(1)
  end
  it "should return the outcome as double as probability of double is 100 %" do
    probability = PlayerProbability.new(0,0,100,0,0,0,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(2)
  end
  it "should return the outcome as triple as probability of triple is 100 %" do
    probability = PlayerProbability.new(0,0,0,100,0,0,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(3)
  end
  it "should return the outcome as four as probability of four is 100 %" do
    probability = PlayerProbability.new(0,0,0,0,100,0,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(4)
  end
  it "should return the outcome as five as probability of five is 100 %" do
    probability = PlayerProbability.new(0,0,0,0,0,100,0,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(5)
  end
  it "should return the outcome as single as probability of six is 100 %" do
    probability = PlayerProbability.new(0,0,0,0,0,0,100,0)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql(6)
  end
  it "should return the outcome as out as probability of out is 100 %" do
    probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player = Player.new("test", probability)
    expect(player.play_ball()).to eql("out")
  end
end

describe "player should update his own score" do
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(100,0,0,0,0,0,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(0)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(2)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,100,0,0,0,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(4)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,0,100,0,0,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(6)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,0,0,100,0,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(8)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,0,0,0,100,0,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(10)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,0,0,0,0,100,0)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(12)
  end
  it "should return total runs scored by him after playing the particular ball" do
    probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_runs()).to eql(0)
  end
end

describe "player should update total balls faced by him" do
  it "should return total balls faced by him at any point in the match" do
    probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player = Player.new("test", probability)
    player.play_ball()
    player.play_ball()
    expect(player.get_balls_faced()).to eql(2)
  end
  it "should return total balls faced by him at any point in the match" do
    probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player = Player.new("test", probability)
    expect(player.get_balls_faced()).to eql(0)
  end
end