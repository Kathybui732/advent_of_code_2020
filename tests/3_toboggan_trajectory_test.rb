require 'minitest/autorun'
require 'minitest/pride'
require './lib/3_toboggan_trajectory'

class TobogganTrajectoryTest < MiniTest::Test

  def setup
    @tt = TobogganTrajectory.new
    @example_gird = {
      0 => '..##.......',
      1 => '#...#...#..',
      2 => '.#....#..#.',
      3 => '..#.#...#.#',
      4 => '.#...##..#.',
      5 => '..#.##.....',
      6 => '.#.#.#....#',
      7 => '.#........#',
      8 => '#.##...#...',
      9 => '#...##....#',
      10 => '.#..#...#.#'
    }
    @grid = @tt.get_grid('./csv_files/3_toboggan_trajectory.csv')
  end

  def test_it_exists_with_attributes
    assert_instance_of TobogganTrajectory, @tt
  end

  def test_number_of_trees_hit
    assert_equal 7, @tt.trees_hit(@example_grid, 3, 1)
    # assert_equal 7, @tt.trees_hit(@grid, 3, 1)
  end
end
