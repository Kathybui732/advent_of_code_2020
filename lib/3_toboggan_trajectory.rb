require 'csv'

class TobogganTrajectory

  def get_grid(csv_location)
    grid = {}
    row_number = 0

    CSV.foreach(csv_location) do |row|
      grid[row_number] = row[0]
      row_number += 1
    end
    grid
  end

  def trees_hit(grid, x, y)
    number_of_trees_hit = 0

    grid.each do |row_number, row|
      # full_row = row * (((row_number * x)/row.size) + 1)

      condition_1 = (row_number % y) == 0
      condition_2 = row[(((row_number / y) * x)%row.size)] == '#'

      number_of_trees_hit += 1 if condition_1 && condition_2
    end
    number_of_trees_hit
  end
end
