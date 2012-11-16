class CreateApplicationFormFields < ActiveRecord::Migration
  def change
    create_table :application_form_fields do |t|
      t.references :application_form
      t.references :form_field
      t.text :field_answer

      t.timestamps
    end
    add_index :application_form_fields, :application_form_id
    add_index :application_form_fields, :form_field_id
  end
end
