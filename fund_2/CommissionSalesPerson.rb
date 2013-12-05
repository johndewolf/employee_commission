class CommissionSalesPerson < Employee
  attr_accessor :amount_sold
  attr_reader :commission_earned

  def initialize(data)
    super(data)
    @commission = data[:commission].to_f
    @amount_sold = 0
  end

  def monthly_salary
    super
    @commission_earned = @commission * @amount_sold
    @gross_salary += @commission_earned
  end


end
