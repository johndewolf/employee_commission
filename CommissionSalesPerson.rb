class CommissionSalesPerson < Employee
  attr_reader :commission

  def initialize(first_name, last_name, salary, commission_rate)
    super(first_name, last_name, salary, commission_rate)
  end


end
