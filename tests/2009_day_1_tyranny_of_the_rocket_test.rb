require 'minitest/autorun'
require 'minitest/pride'
require './lib/2009_day_1_tyranny_of_the_rocket'

class RocketTest < MiniTest::Test

  def setup
    @rocket = Rocket.new
    @example_masses = [12, 14, 1969, 100756]
    @masses = @rocket.get_mass_collection('./csv_files/2019_day_1_tyranny_of_the_rocket.csv')
  end

  def test_it_exists_with_attributes
    assert_instance_of Rocket, @rocket
  end

  def test_it_can_get_mass_collection
    assert_equal Array, @masses.class
  end

  def test_it_can_get_fuel
    assert_equal 2, @rocket.get_fuel(12)
    assert_equal 2, @rocket.get_fuel(14)
    assert_equal 654, @rocket.get_fuel(1969)
    assert_equal 33583, @rocket.get_fuel(100756)
  end

  def test_it_can_get_total_fuel
    assert_equal 34241, @rocket.get_total_fuel(@example_masses)
    assert_equal 3392373, @rocket.get_total_fuel(@masses)
  end

  def test_it_can_get_new_total_fuel
    assert_equal 51316, @rocket.get_new_total_fuel(@example_masses)
    assert_equal 3392373, @rocket.get_new_total_fuel(@masses)
  end
end
