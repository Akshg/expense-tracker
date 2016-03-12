class ExpensesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @expenses = Expense.for_user(current_user.id)
    end
    
    def new
        @expense = Expense.new
        @expense_category = ExpenseCategory.get_all_categories
    end
    
    def create
        @expense = Expense.new(expense_params)
        @expense.update_attributes(user_id: current_user.id)
        if @expense.save
         redirect_to expenses_path
        else
         render 'new'
        end
    end
    
    def edit
        @expense = Expense.find_by(id: params[:id])
    end
    
    def update
        @expense = Expense.find_by(id: params[:id])
        if @expense.update_attributes(expense_params)
            redirect_to expenses_path
        else
            render 'edit'
        end
        
    end
    
    def destroy
        @expense = Expense.find_by(id: params[:id])
        @expense.destroy
        redirect_to expenses_path
    end
    
  private
  def expense_params
    params.require(:expense).permit(:amount, :description, :expense_category_id)
  end
    
end
