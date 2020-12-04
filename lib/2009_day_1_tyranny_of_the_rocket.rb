require 'csv'

class Rocket

  def get_mass_collection(csv_location)
    collection = []
    CSV.foreach(csv_location) do |row|
      collection << row[0].to_i
    end
    collection
  end

  def get_fuel(mass)
    (mass / 3).floor - 2
  end

  def get_total_fuel(mass_list)
    mass_list.sum do |mass|
      get_fuel(mass)
    end
  end

  def get_all_fuel(mass)
    if fuel > 0
      get_fuel(mass)
    end
    get_fuel(mass)
  end

  def get_new_total_fuel(mass_list)
    mass_list.sum do |mass|

    end
  end
end
