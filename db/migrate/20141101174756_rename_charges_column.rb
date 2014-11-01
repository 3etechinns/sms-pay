class RenameChargesColumn < ActiveRecord::Migration
  def change
    rename_column :charges, :balance, :amount
  end
end
