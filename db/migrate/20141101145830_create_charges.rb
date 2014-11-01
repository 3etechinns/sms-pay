class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :organization, index: true
      t.references :user, index: true
      t.decimal :balance

      t.timestamps
    end
  end
end
