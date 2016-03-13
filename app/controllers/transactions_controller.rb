class TransactionsController < ApplicationController
    before_filter :authenticate_user!
   
   def index
       @transactions = Transaction.for_user(current_user.id)
   end
   
   def new
      
   end
   
   def create
     
   end
   
   def edit
   end
   
   def update
   end
   
   def destroy
   end
    
end