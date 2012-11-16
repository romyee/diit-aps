class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.references :form
      t.string :label
      t.text :description
      t.string :answer_type
      t.boolean :mandetory
      t.text :answer_opitons

      t.timestamps
    end
    add_index :form_fields, :form_id
  end
end
