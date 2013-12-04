class Employee
  attr_reader :first_name, :last_name, :salary, :monthly_salary, :gross_salary
  attr_accessor :amount_sold, :total_commission

  def initialize(first_name, last_name, salary, commission_rate)
    @first_name = first_name
    @last_name = last_name
    @salary = salary
    @commission_rate = commission_rate
    @monthly_salary = monthly_salary
    @amount_sold = 0
    @gross_salary = monthly_salary
    @netpay = 0
  end

  def net_pay
   @netpay = @gross_salary * 0.7
  end

  def monthly_salary
    (@salary / 12.0).round(2)
  end

  def commission_calculator
    @total_commission = @amount_sold * @commission_rate
    @gross_salary += @total_commission
  end

  def met_quota?
  end

  def company_quota?
  end
end
