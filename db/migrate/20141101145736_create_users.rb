class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.decimal :balance
      t.string :phone

      t.timestamps
    end
  end
end
