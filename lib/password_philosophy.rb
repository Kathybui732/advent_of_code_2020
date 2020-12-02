class PasswordPhilosophy

  def valid_password_count(password_list)
    valid_password_counter = 0
    password_list.each do |password_data| # O(n)
      letter_range = password_data[0] # O(n)
      required_lettter = password_data[1] # O(n)
      password = password_data[2] # O(n)

      letter_count = password.count(required_lettter) # O(n)

      valid_password_counter += 1 if letter_range === letter_count # O(1)
    end
    valid_password_counter
  end # OVERALL O(n^2)

  def find_all_valid(password_list)
    x = password_list.select do |password_data|
      letter_range = password_data[0] # O(n)
      required_lettter = password_data[1] # O(n)
      password = password_data[2] # O(n)

      letter_count = password.count(required_lettter) # O(n)

      letter_range === letter_count # O(1)
    end
    x.size
  end
end
