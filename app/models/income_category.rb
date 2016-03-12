class IncomeCategory < ActiveRecord::Base
  self.table_name = 'income_categories'
  has_many :incomes
  
  def self.get_all_categories
    IncomeCategory.all.pluck(:category_name)
  end
  
end