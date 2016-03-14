class ExpenseCategory < ActiveRecord::Base
  self.table_name = 'expense_categories'
  has_many :expenses
  
  def self.for_user(user_id)
    ExpenseCategory.where(user_id: user_id)
  end
  
end