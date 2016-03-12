class Income < ActiveRecord::Base
  self.table_name = 'incomes'
  has_one :income_category
end