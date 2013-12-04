class Sale
  attr_reader :name, :amount

  @@all_sales = []

  def initialize(name, amount)
    @name = name
    @amount = amount
    @@all_sales << amount
  end

  def self.calc_total
    @@all_sales.inject(:+)
  end

  def gets_total
    @@all_sales
  end
end
