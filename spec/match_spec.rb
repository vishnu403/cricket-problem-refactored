require_relative ("../match.rb")

describe "setting strike for player " do
  it "should set player1's strike as true" do
    player1 = Player.new("test1", nil)
    player2 = Player.new("test2", nil)
    players = [player1, player2]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    expect(match.get_strike_player()).to eql(player1)
  end
  it "should set player1's strike as true" do
    player1_probability = PlayerProbability.new(0,0,0,0,100,0,0,0)
    player2_probability = PlayerProbability.new(0,0,0,0,100,0,0,0)
    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    players = [player1, player2]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    match.carry_on()
    expect(match.runs_left).to eql(36)
  end
  it "should change the strike if the outcome is odd" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    players = [player1, player2]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    match.carry_on()

    expect(match.get_strike_player()).to eql(player2)
  end
  it "should not change the strike if the outcome is even" do
    player1_probability = PlayerProbability.new(0,0,100,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    players = [player1, player2]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    match.carry_on()
    expect(match.get_strike_player()).to eql(player1)
  end
end

describe "player gets out" do
  it "should set the player property as ooooout" do
    player1_probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    player3 = Player.new("test2", player3_probability)
    players = [player1, player2,player3]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    match.carry_on()
    expect(player1.get_out_status?()).to eql(true)
  end
  it "should set the strike player to the new player on list" do
    player1_probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)

    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    player3 = Player.new("test2", player3_probability)

    players = [player1, player2,player3]
    match = Match.new(players,40,3,24)
    match.set_initial_strike()
    match.carry_on()
    expect(match.get_strike_player()).to eql(player3)
  end
end

describe "change strike if an over is complete" do
  it "should set chnage the strike player when an over is completed" do
    player1_probability = PlayerProbability.new(0,0,100,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)

    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    player3 = Player.new("test2", player3_probability)

    players = [player1, player2,player3]
    match = Match.new(players,40,3,19)
    match.set_initial_strike()
    # match.balls_left = 19
    match.carry_on()
    expect(match.get_strike_player()).to eql(player2)
  end
  it "should set be back on strike if he playes for a single on the last ball" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)

    player1 = Player.new("test1", player1_probability)
    player2 = Player.new("test2", player2_probability)
    player3 = Player.new("test2", player3_probability)

    players = [player1, player2,player3]
    match = Match.new(players,40,3,19)
    match.set_initial_strike()
    match.carry_on()
    expect(match.get_strike_player()).to eql(player1)
  end
end