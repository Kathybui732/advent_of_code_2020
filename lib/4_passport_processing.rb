class PassportProcessing

  # def parse_data(data)
  #   data = data.split("\n\n")
  # end
  #
  # def number_of_valid_passports(passport_data, details, ignore)
  #   # data = parse_data(passport_data)
  #
  #   details.delete(ignore)
  #
  #   passport_data.count do |input|
  #     valid_passport_part_2?(input, details)
  #   end
  # end

  def valid_passport?(passport_str, details)
    details.all? do |field|
      passport_str.include?(field)
    end
  end

  def valid_birth_year?(input)
    if input[:byr] == nil
      false
    else
      input[:byr].to_i >= 1920 && input[:byr].to_i <= 2002
    end
  end

  def valid_issue_year?(input)
    if input[:iyr] == nil
      false
    else
      input[:iyr].to_i >= 2010 && input[:iyr].to_i <= 2020
    end
  end

  def valid_exp_year?(input)
    if input[:eyr] == nil
      false
    else
      input[:eyr].to_i >= 2020 && input[:eyr].to_i <= 2030
    end
  end

  def valid_height?(input)
    if input[:hgt] == nil
      false
    elsif input[:hgt].include?('cm')
      input[:hgt].to_i >= 150 && input[:hgt].to_i <= 193
    elsif input[:hgt].include?('in')
      input[:hgt].to_i >= 59 && input[:hgt].to_i <= 76
    end
  end

  def valid_hair_color?(input)
    if input[:hcl] == nil
      false
    else
      input[:hcl].gsub(/[^0-9a-z]/i, '').size == 6 && input[:hcl].start_with?('#')
    end
  end

  def valid_eye_color?(input)
    if input[:ecl] == nil
      false
    else
      valid_eye_colors = 'amb blu brn gry grn hzl oth'
      valid_eye_colors.include?(input[:ecl])
    end
  end

  def valid_passport_id?(input)
    if input[:pid] == nil
      false
    else
      input[:pid].size == 9
    end
  end

  def valid_passport_details?(input)
    a = valid_birth_year?(input)
    b = valid_issue_year?(input)
    c = valid_exp_year?(input)
    d = valid_height?(input)
    e = valid_hair_color?(input)
    f = valid_eye_color?(input)
    g = valid_passport_id?(input)

    a && b && c && d && e && f && g
  end

  def number_of_valid_passports(input)
    x = input.count do |i|
      valid_passport_details?(i)
    end
  end
end
