require 'pry'
require 'csv'
require_relative 'Employee'
require_relative 'EmployeeReader'
require_relative 'Owner'
require_relative 'CommissionSalesPerson'
require_relative 'QuotaSalesPerson'
require_relative 'SalesReader'
require_relative 'Sale'

employee_info_file = 'employee_info.csv'
employees = EmployeeReader.new(employee_info_file)
sales_info = 'sales_data.csv'
sales = SalesReader.new(sales_info)
employees.read_file

sales.sales.each do |sale|
  employee_name = employees.employees.find {|employee| sale.name == employee.last_name}
  employee_name.amount_sold += sale.amount
end

employees.employees.each do |employee|
  employee.commission_calculator
  if employee.met_quota? == true || employee.company_quota? == true
    employee.add_bonus
  end
end

employees.employees.each do |employee|
  puts "***#{employee.first_name} #{employee.last_name}***"
  puts "Gross Salary: $#{employee.gross_salary.round(2)}"
  if employee.total_commission > 0
    puts "Commission: $#{employee.total_commission.round(2)}"
  end
  if employee.met_quota? != nil
    puts "Met Quota? #{employee.met_quota?}"
  end
  puts "Net Pay: $#{employee.net_pay.round(2)}"
  puts nil
end
