require 'minitest/autorun'
require 'minitest/pride'
require './lib/3_toboggan_trajectory'

class TobogganTrajectoryTest < MiniTest::Test

  def setup
    @tt = TobogganTrajectory.new
  end

  def test_it_exists_with_attributes
    assert_instance_of TobogganTrajectory, @tt
  end
end
