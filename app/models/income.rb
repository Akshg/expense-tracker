class Income < ActiveRecord::Base
  self.table_name = 'incomes'
  has_many :transactions, as: :transactionable
  belongs_to :income_category
  
  def self.get_category(category_id)
    IncomeCategory.find_by(id: category_id).category_name
  end
  
  def self.for_user(user_id)
    Income.where(user_id: user_id)
  end
  
  def self.for_month(month)
    if  month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || 
         month == 10 || month == 12 
     end_date_of_month = 31
    elsif  month == 2
     end_date_of_month = 28
    else
     end_date_of_month = 30
    end
   start_day = DateTime.parse('01-'+month.to_s+'-2016 00:00:01')
   end_day = DateTime.parse(end_date_of_month.to_s+'-'+month.to_s+'-2016 23:59:59')
   Income.where(created_at: start_day..end_day)
  end
  
end