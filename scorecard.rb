class Scorecard
  attr_accessor :ball_summary, :ball_no, :overs_left, :wickets_left, :runs_left
  def initialize(overs_left, runs_left, wickets_left, ball_no = nil , ball_summary = nil)
    @ball_no = ball_no
    @ball_summary = ball_summary
    @overs_left = overs_left
    @wickets_left = wickets_left
    @runs_left = runs_left
  end
  def display_after_each_ball()
    puts "#{(4-@overs_left)+ @ball_no} #{@ball_summary}"
    "#{(4-@overs_left)+ @ball_no} #{@ball_summary}"
  end
  def display_before_over()
    puts "\n#{@overs_left} overs left, #{@runs_left} runs required and #{@wickets_left} wickets remaining \n\n"
    "\n#{@overs_left} overs left, #{@runs_left} runs required and #{@wickets_left} wickets remaining \n\n"
  end
end