class QuotaSalesPerson < Employee
  attr_accessor :amount_sold

  def initialize(data)
    super(data)
    @quota = data[:quota].to_i
    @bonus = data[:bonus].to_i
    @amount_sold = 0
  end

  def monthly_salary
    super
    if quota_hit? == true
      @gross_salary += @bonus
    else
      @gross_salary
    end
  end

  def quota_hit?
    true if @amount_sold >= @quota
  end
end
