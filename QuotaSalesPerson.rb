class QuotaSalesPerson < Employee
  attr_accessor :bonus, :quota

  def initialize(first_name, last_name, salary, commission_rate, bonus, quota)
    super(first_name, last_name, salary, commission_rate)
    @quota = quota
    @bonus = bonus
  end

  def met_quota?
    @amount_sold >= @quota
  end

  def add_bonus
    @gross_salary += @bonus
  end
end
