class Expense < ActiveRecord::Base
  self.table_name = 'expenses'
  belongs_to :expense_category
  
  def self.get_category(category_id)
    ExpenseCategory.find_by(id: category_id).category_name
  end
  
  def self.for_user(user_id)
    Expense.where(user_id: user_id)
  end
  
end