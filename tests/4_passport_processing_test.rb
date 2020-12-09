require 'minitest/autorun'
require 'minitest/pride'
require './lib/4_passport_processing'

class PassportProcessingTest < MiniTest::Test

  def setup
    @passport_details = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid', 'cid']
    @pp = PassportProcessing.new
    @passport_input_example = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in"

@passport_input_hash = [{'ecl':'gry', 'pid':'860033327', 'eyr':'2020', 'hcl':'#fffffd', 'byr':'1937', 'iyr':'2017', 'cid':'147', 'hgt':'183cm'}, {'iyr':'2013', 'ecl':'amb', 'cid':'350', 'eyr':'2023', 'pid':'028048884', 'hcl':'#cfa07d', 'byr':'1929'}, {'hcl':'#ae17e1', 'iyr':'2013', 'eyr':'2024', 'ecl':'brn', 'pid':'760753108', 'byr':'1931', 'hgt':'179cm'}, {'hcl':'#cfa07d', 'eyr':'2025', 'pid':'166559648', 'iyr':'2011', 'ecl':'brn', 'hgt':'59in'}]
  end

  def test_it_exists_with_attributes
    assert_instance_of PassportProcessing, @pp
  end

  # def test_it_can_parse_data
  #   assert_equal ['a', 'b'], @pp.parse_data("a\n\nb")
  #   expected = ["ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm", "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\nhcl:#cfa07d byr:1929", "hcl:#ae17e1 iyr:2013\neyr:2024\necl:brn pid:760753108 byr:1931\nhgt:179cm", "hcl:#cfa07d eyr:2025 pid:166559648\niyr:2011 ecl:brn hgt:59in"]
  #   assert_equal expected, @pp.parse_data(@passport_input_example)
  # end

  def test_valid_passport?
    assert_equal true, @pp.valid_passport?("ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm", @passport_details)
    assert_equal false, @pp.valid_passport?("iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\nhcl:#cfa07d byr:1929", @passport_details)
  end

  # def test_number_of_valid_passports
  #   assert_equal 2, @pp.number_of_valid_passports(@passport_input_example, @passport_details, 'cid')
  #
  #   file = File.open('./csv_files/4_passport_processing_data.txt')
  #   passport_input = file.read
  #
  #   assert_equal 190, @pp.number_of_valid_passports(passport_input, @passport_details, 'cid')
  #
  #   file.close
  # end

  def test_number_of_valid_passports

    # THis should be refactored into a get_csv method in the class instead
    file = File.open('./csv_files/4_passport_processing_data.txt')
    passport_input = file.read
    input = passport_input.split("\n\n")
    input_hash = input.map do |i|
      hash = {}
      i.split(' ').each do |e|
        h = e.split(':')
        hash[h[0].to_sym] = h[1]
      end
      hash
    end

    assert_equal 2, @pp.number_of_valid_passports(@passport_input_hash)
    assert_equal 121, @pp.number_of_valid_passports(input_hash)

    file.close
  end
end
