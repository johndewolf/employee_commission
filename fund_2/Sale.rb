class Sale
  attr_reader :last_name, :gross_sale_value

  @@sales = []

  def initialize(last_name, gross_sale_value)
    @last_name = last_name
    @gross_sale_value = gross_sale_value
    @@sales << @gross_sale_value
  end

  def self.total_sales
    @@sales.inject(:+)
  end
end
