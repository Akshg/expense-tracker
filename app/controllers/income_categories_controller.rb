class IncomeCategoriesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
     @income_categories = IncomeCategory.for_user(current_user.id)
    end
    
    def new
     @income_category = IncomeCategory.new
    end
    
    def create
     @income_category = IncomeCategory.new(income_category_params)
     @income_category.update_attributes(user_id: current_user.id)
      if @income_category.save
       redirect_to income_categories_path
      else
       render 'new'
      end
    end
    
    def edit
     @income_category = IncomeCategory.find_by(id: params[:id])
    end

    def update
     @income_category = IncomeCategory.find_by(id: params[:id])
     @income_category.update_attributes(user_id: current_user.id)
     if @income_category.update_attributes(income_category_params)
      redirect_to income_categories_path
     else
      render 'edit'
     end
    end

    def destroy
     @income_category = IncomeCategory.find_by(id: params[:id])
     @income_category.destroy
     redirect_to income_categories_path
    end

  private
  def income_category_params
    params.require(:income_category).permit(:category_name)
  end

end