class Income < ActiveRecord::Base
  self.table_name = 'incomes'
  belongs_to :income_category
  
  def self.get_category(category_id)
    IncomeCategory.find_by(id: category_id).category_name
  end
  
  def self.for_user(user_id)
    Income.where(user_id: user_id)
  end
  
end