require_relative ("../player_probability.rb")
  describe "probability checking" do
    it "should return six as it has 100% probability" do
      probability = PlayerProbability.new(0,0,0,0,0,0,100,0)
      expect(probability.get_outcome()).to eql(6)
    end
    it "should return dot as it has 100% probability" do
      probability = PlayerProbability.new(100,0,0,0,0,0,0,0)
      expect(probability.get_outcome()).to eql(0)
    end
    it "should return single as it has 100% probability" do
      probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
      expect(probability.get_outcome()).to eql(1)
    end
    it "should return double as it has 100% probability" do
      probability = PlayerProbability.new(0,0,100,0,0,0,0,0)
      expect(probability.get_outcome()).to eql(2)
    end
    it "should return triple as it has 100% probability" do
      probability = PlayerProbability.new(0,0,0,100,0,0,0,0)
      expect(probability.get_outcome()).to eql(3)
    end
    it "should return four as it has 100% probability" do
      probability = PlayerProbability.new(0,0,0,0,100,0,0,0)
      expect(probability.get_outcome()).to eql(4)
    end
    it "should return five as it has 100% probability" do
      probability = PlayerProbability.new(0,0,0,0,0,100,0,0)
      expect(probability.get_outcome()).to eql(5)
    end
    it "should return six as it has 100% probability" do
      probability = PlayerProbability.new(0,0,0,0,0,0,0,100)
      expect(probability.get_outcome()).to eql("out")
    end
  end
