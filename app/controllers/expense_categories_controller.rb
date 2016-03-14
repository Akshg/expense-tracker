class ExpenseCategoriesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
      @expense_categories = ExpenseCategory.for_user(current_user.id)
    end
    
    def new
      @expense_category = ExpenseCategory.new
    end
    
    def create
        @expense_category = ExpenseCategory.new(expense_category_params)
        @expense_category.update_attributes(user_id: current_user.id)
        if @expense_category.save
         redirect_to expense_categories_path
        else
         render 'new'
        end
    end
    
    def edit
         @expense_category = ExpenseCategory.find_by(id: params[:id])
    end

    def update
        @expense_category = ExpenseCategory.find_by(id: params[:id])
        if @expense_category.update_attributes(expense_category_params)
            redirect_to expense_categories_path
        else
            render 'edit'
        end
    end

    def destroy
        @expense_category = ExpenseCategory.find_by(id: params[:id])
        @expense_category.destroy
        redirect_to expense_categories_path
    end
    
  private
  def expense_category_params
    params.require(:expense_category).permit(:category_name)
  end



end