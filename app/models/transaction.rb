class Transaction < ActiveRecord::Base
   self.table_name = 'transactions'
   belongs_to :transactionable, polymorphic: :true
   
   def self.for_user(user_id)
    Transaction.where(user_id: user_id)
   end
   
   def self.save(transaction, type, user_id)
       type = type.singularize
       type = type.capitalize
       if Transaction.where(user_id: user_id).empty?
          balance = 0
          balance = balance + transaction.amount if type == 'Income'
  	      balance = balance - transaction.amount if type == 'Expense'
          Transaction.create(transactionable_id: transaction.id,
                            transactionable_type: type,
                            user_id: user_id,
                            balance: balance)
       else
          balance = Transaction.last.balance
          balance = balance + transaction.amount if type == 'Income'
  	      balance = balance - transaction.amount if type == 'Expense'
          Transaction.create(transactionable_id: transaction.id,
                            transactionable_type: type,
                            user_id: user_id,
                            balance: balance)
       end
   end
   
end