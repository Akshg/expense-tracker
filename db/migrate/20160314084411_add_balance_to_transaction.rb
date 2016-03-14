class AddBalanceToTransaction < ActiveRecord::Migration
  def change
   change_table :transactions do |t|
      t.decimal :balance, precision: 10, scale: 4
    end
  end
end
