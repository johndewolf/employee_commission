require_relative 'EmployeeReader'
require_relative 'Employee'
require_relative 'QuotaSalesPerson'
require_relative 'CommissionSalesPerson'
require_relative 'Owner'
require_relative 'Sale'
require_relative 'SaleReader'

require 'csv'
require 'pry'

import_csv = EmployeeReader.new('employee_info.csv')
import_csv.import_file
array_of_employees = import_csv.employees

read_sales = SaleReader.new('sales_data.csv')
read_sales.import_sales
array_of_sales = read_sales.sales

array_of_employees.each do |employee|
  array_of_sales.each do |sale|
    if employee.last_name == sale.last_name
      employee.amount_sold += sale.gross_sale_value
    end
  end
  employee.monthly_salary
end

# array_of_employees.each do |employee|

# end


array_of_employees.each do |employee|
  puts "***#{employee.first_name} #{employee.last_name}***"
  puts "Gross Salary: $#{employee.monthly_salary}"
  if employee.job == 'Commission'
    puts "Commission: #{employee.commission_earned}"
  elsif employee.job == 'Quota'
    puts "Quota Hit?: #{employee.quota_hit?}"
  elsif employee.job == 'Owner'
    puts "Hit Company Quota?: #{employee.hit_company_quota?}"
  else
    nil
  end
  puts "Net Pay: #{employee.net_pay}"
end


