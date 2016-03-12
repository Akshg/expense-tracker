class Expense < ActiveRecord::Base
  self.table_name = 'expenses'
  has_one :expense_category
end