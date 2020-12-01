class ReportRepair
  def expense_report_repair_two_values(expense_report, sum)
    checked_values = {}

    expense_report.each_with_index do |value_1, index|
      value_2 = sum - value_1

      if checked_values[value_2]
        return expense_report[checked_values[value_2]] * expense_report[index]
      else
        checked_values[value_1] = index
      end
    end
  end

  def expense_report_repair_three_values(expense_report, sum)
    expense_report.sort! # O(n^2) worse case scenario

    (0..expense_report.size - 3).each do |index| # O(n)
      value_1 = expense_report[index]
      index_2 = index + 1
      index_3 = expense_report.size - 1

      while index_2 < index_3 do # O(n)
        value_2 = expense_report[index_2]
        value_3 = expense_report[index_3]

        if (value_1 + value_2 + value_3) > sum # O(1)
          index_3 -= 1
        else
          index_2 += 1
        end

        return (value_1 * value_2 * value_3) if (value_1 + value_2 + value_3 == sum)
      end
    end # So this is O(n) * O(n) * O(1) = O(n^2)
    "There are no solutions"
  end # O(n^2) and O(n^2) for both parts, so, worse case scenario it is O(n^2)
end
# ---------------------------------------------
# On^2 solution

# class ReportRepair
#   attr_reader :value_1, :value_2, :expense_report
#
#   def initialize(expense_report)
#     @expense_report = expense_report
#     @value_1 = nil
#     @value_2 = nil
#   end
#
#   def expense_report_repair
#     until !@value_2.nil? do
#       @value_1 = @expense_report[-1]
#       @value_2 = @expense_report.find do |expense|
#         expense == 2020 - @value_1
#       end
#       @expense_report.delete(@value_1)
#     end
#     @value_1 * @value_2
#   end
# end
