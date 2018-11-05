require_relative("../scorecard.rb")

describe "testing before each over" do
  it "should return the status after each over" do
    scorecard= Scorecard.new(4,40,3,nil,nil)
    expect(scorecard.display_before_over()).to eql("\n4 overs left, 40 runs required and 3 wickets remaining \n\n")
  end
end

describe "testing after each ball" do
  it "should return the status after each ball" do
    scorecard= Scorecard.new(4,40,3,0.2,"test1 scores 2 runs")
    expect(scorecard.display_after_each_ball()).to eql("0.2 test1 scores 2 runs")
  end
  it "should return the status after each ball" do
    scorecard= Scorecard.new(3,40,3,0.2,"test1 scores 2 runs")
    expect(scorecard.display_after_each_ball()).to eql("1.2 test1 scores 2 runs")
  end
end