class SaleReader
  attr_reader :sales

  def initialize(file)
    @file = file
    @sales = []
  end

  def import_sales
    CSV.foreach(@file, headers: true) do |row|
      last_name = row['last_name']
      gross_sale_value = row['gross_sale_value'].to_i
      @sales << Sale.new(last_name, gross_sale_value)
    end
  end


end
