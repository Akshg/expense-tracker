class IncomesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @incomes = Income.for_user(current_user.id)
    end
    
    def new
        @income = Income.new
        @income_category = IncomeCategory.get_all_categories
    end
    
    def create
        @income = Income.new(income_params)
        @income.update_attributes(user_id: current_user.id)
        if @income.save
          Transaction.save(@income, params[:controller], current_user.id)
         redirect_to incomes_path
        else
         render 'new'
        end
    end
    
    def edit
        @income = Income.find_by(id: params[:id])
    end
    
    def update
        @income = Income.find_by(id: params[:id])
        if @income.update_attributes(income_params)
            redirect_to incomes_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @income = Income.find_by(id: params[:id])
        @income.destroy
        redirect_to incomes_path
    end
    
  private
  def income_params
    params.require(:income).permit(:amount, :description, :income_category_id, :created_at)
  end
    
end