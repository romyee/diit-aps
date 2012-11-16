class CreateApplicationProcesses < ActiveRecord::Migration
  def change
    create_table :application_processes do |t|
      t.references :application_form
      t.integer :refferer_id
      t.integer :reffer_to_id
      t.string :purpose
      t.text :message
      t.integer :status, :default => 1

      t.timestamps
    end
    add_index :application_processes, :application_form_id
    add_index :application_processes, :refferer_id
    add_index :application_processes, :reffer_to_id
    add_index :application_processes, :status
  end
end
