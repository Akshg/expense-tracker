class ExpenseCategory < ActiveRecord::Base
  self.table_name = 'expense_categories'
  has_many :expenses
end