class AddChargesColumns < ActiveRecord::Migration
  def change
    add_column :charges, :concept, :string
    add_column :charges, :status, :string
  end
end
