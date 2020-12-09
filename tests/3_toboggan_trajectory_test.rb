require 'minitest/autorun'
require 'minitest/pride'
require './lib/3_toboggan_trajectory'

class TobogganTrajectoryTest < MiniTest::Test

  def setup
    @tt = TobogganTrajectory.new
    @example_grid = {
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
    assert_equal 2, @tt.trees_hit(@example_grid, 1, 1)
    assert_equal 3, @tt.trees_hit(@example_grid, 5, 1)
    assert_equal 4, @tt.trees_hit(@example_grid, 7, 1)
    assert_equal 2, @tt.trees_hit(@example_grid, 1, 2)
    assert_equal 234, @tt.trees_hit(@grid, 3, 1)
    assert_equal 79, @tt.trees_hit(@grid, 1, 1)
    assert_equal 72, @tt.trees_hit(@grid, 5, 1)
    assert_equal 91, @tt.trees_hit(@grid, 7, 1)
    assert_equal 48, @tt.trees_hit(@grid, 1, 2)
  end
end
