class SalesReader
  attr_accessor :sales

  def initialize(file)
    @file = file
    @sales = []
    read_sales
  end

  def read_sales
    CSV.foreach(@file, headers:true,header_converters: :symbol) do |row|
      @sales << make_sale(row)
    end
  @sales
  end

  def make_sale(sale_attributes)
      name = sale_attributes[:last_name]
      amount = sale_attributes[:gross_sale_value].to_i
      Sale.new(name, amount)
  end

end
