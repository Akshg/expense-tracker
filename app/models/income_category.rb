class IncomeCategory < ActiveRecord::Base
  self.table_name = 'income_categories'
  has_many :incomes
end