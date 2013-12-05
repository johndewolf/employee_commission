class Employee
  attr_reader :first_name, :gross_salary, :last_name, :job, :base_salary, :commission

  def initialize(data)
    @job = data[:job]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @base_salary = data[:base_salary].to_f
  end

  def monthly_salary
    @gross_salary = (@base_salary / 12).round(2)
  end

  def net_pay
    @gross_salary * 0.7
  end

end
