#Employee, Owner, CommissionSalesPerson, QuotaSalesPerson, Sale

class EmployeeReader
  attr_reader :employees

  def initialize(file)
    @file = file
    @employees = []
  end

  def import_file
    CSV.foreach(@file, headers:true, header_converters: :symbol) do |row|
      @employees << create_employee(row.to_hash)
    end
    @employees
  end

  def create_employee(row)
    job = row[:job]

    if job == 'Quota'
      QuotaSalesPerson.new(row)
    elsif job == 'Commission'
      CommissionSalesPerson.new(row)
    elsif job == 'Owner'
      Owner.new(row)
    else
      Employee.new(row)
    end
  end

end
