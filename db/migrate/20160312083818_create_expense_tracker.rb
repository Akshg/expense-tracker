class CreateExpenseTracker < ActiveRecord::Migration
  def change
    
    add_column :users, :name, :string
    
    create_table :income_categories do |t|
       t.string :category_name
    end
    
    create_table :incomes do |t|
        t.decimal :amount, precision: 10, scale: 4
        t.text :description
        t.integer :user_id
        t.integer :income_category_id
        t.timestamps null: false
    end
    add_foreign_key :incomes, :users
    add_foreign_key :incomes, :income_categories
    
    create_table :expense_categories do |t|
       t.string :category_name
    end
    
    create_table :expenses do |t|
        t.decimal :amount, precision: 10, scale: 4
        t.text :description
        t.integer :user_id
        t.integer :expense_category_id
        t.timestamps null: false
    end
    add_foreign_key :expenses, :users
    add_foreign_key :expenses, :expense_categories
      
    create_table :transactions do |t|
      t.integer :transactionable_id
      t.string  :transactionable_type
      t.integer :user_id
      t.timestamps null: false
    end
    add_foreign_key :transactions, :users
    add_index :transactions, :transactionable_id
      
  end
end
