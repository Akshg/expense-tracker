class AddUserToCategories < ActiveRecord::Migration
  def change
    add_column :income_categories, :user_id, :integer
    add_foreign_key :income_categories, :users
    
    add_column :expense_categories, :user_id, :integer
    add_foreign_key :expense_categories, :users
  end
end
