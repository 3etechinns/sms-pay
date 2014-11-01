class ChangeBalanceType < ActiveRecord::Migration
  def change
    change_column :users, :balance, :integer
    change_column :charges, :amount, :integer
  end
end
