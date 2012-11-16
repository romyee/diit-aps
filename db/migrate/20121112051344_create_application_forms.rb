class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.references :user
      t.references :form
      t.string :tracking_id
      t.string :comment
      t.integer :status, :null => false, :default => 1

      t.timestamps
    end
    add_index :application_forms, :user_id
    add_index :application_forms, :form_id
  end
end
