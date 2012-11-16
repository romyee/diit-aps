class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name
      t.string :email, :null => false
      t.string :official_id, :null => false
      t.text :permanent_address
      t.text :present_addresss, :null => false
      t.string :contact_number, :null => false
      t.integer :role, :default => 1, :null => false
      t.string :salt_key, :null => false
      t.string :hashed_password, :null => false
      t.string :recover_hash
      t.integer :status, :default => 1, :null => false

      t.timestamps
    end
  end
end
