class IncomeCategory < ActiveRecord::Base
  self.table_name = 'income_categories'
  has_many :incomes
  
  def self.for_user(user_id)
    IncomeCategory.where(user_id: user_id)
  end
  
end