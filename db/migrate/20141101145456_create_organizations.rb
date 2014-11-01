class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :paypal
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
