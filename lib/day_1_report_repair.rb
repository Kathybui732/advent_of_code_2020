class ReportRepair
  attr_reader :value_1, :value_2, :expense_report

  def initialize(expense_report)
    @expense_report = expense_report
    @value_1 = nil
    @value_2 = nil
  end

  def expense_report_repair
    until !@value_2.nil? do
      @value_1 = @expense_report[-1]
      @value_2 = @expense_report.find do |expense|
        expense == 2020 - @value_1
      end
      @expense_report.delete(@value_1)
    end
    @value_1 * @value_2
  end
end
