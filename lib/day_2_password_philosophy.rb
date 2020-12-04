class PasswordPhilosophy

  def valid_password_count(password_list)
    valid_password_counter = 0
    password_list.each do |password_data| # O(n)
      letter_range = password_data[0] # O(n)
      required_letter = password_data[1] # O(n)
      password = password_data[2] # O(n)

      letter_count = password.count(required_letter) # O(n)

      valid_password_counter += 1 if letter_range === letter_count # O(1)
    end
    valid_password_counter
  end # OVERALL O(n^2)

  def new_valid_password_count(password_list)
    valid_password_counter = 0

    password_list.each do |password_data| # O(n)
      position_a = password_data[0].first
      position_b = password_data[0].last
      required_letter = password_data[1] # O(n)
      password = password_data[2] # O(n)

      condition_1 = (password[position_a -1] == required_letter || password[position_b -1] == required_letter)

      condition_2 = (password[position_a -1] == required_letter && password[position_b -1] == required_letter)

      valid_password_counter += 1 if condition_1 && !condition_2
    end
    valid_password_counter
  end
end
