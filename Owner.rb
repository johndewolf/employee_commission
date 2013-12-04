class Owner < Employee

  def initialize(first_name, last_name, salary, commission_rate, bonus)
    super(first_name, last_name, salary, commission_rate)
    @bonus = bonus
  end

  def company_quota?
    Sale.calc_total > 200000
  end

  def add_bonus
    @gross_salary += @bonus
  end
end
