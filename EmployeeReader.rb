class EmployeeReader
  attr_reader :employees

  def initialize(file)
    @file = file
    @employees = []
  end

  def read_file
    CSV.foreach(@file, headers:true, header_converters: :symbol) do |row|
      @employees << make_employee(row)
    end
  end

  def make_employee(attributes)
    job = attributes[:job]
    first_name = attributes[:first_name]
    last_name = attributes[:last_name]
    salary = attributes[:base_salary].to_i
    bonus = attributes[:bonus].to_i
    quota = attributes[:quota].to_i
    commission_rate = attributes[:commission].to_f
    if job == 'Commission'
      CommissionSalesPerson.new(first_name, last_name, salary, commission_rate)
    elsif job == 'Quota'
      QuotaSalesPerson.new(first_name, last_name, salary, commission_rate, bonus, quota)
    elsif job == 'Owner'
      Owner.new(first_name, last_name, salary, commission_rate, bonus)
    else
      Employee.new(first_name, last_name, salary, commission_rate)
    end
  end
end
