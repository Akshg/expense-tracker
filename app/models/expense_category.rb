class ExpenseCategory < ActiveRecord::Base
  self.table_name = 'expense_categories'
  has_many :expenses
  
  def self.get_all_categories
    IncomeCategory.all.pluck(:category_name)
  end
  
end