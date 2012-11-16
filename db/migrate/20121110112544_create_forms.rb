class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title, :null => false
      t.string :sub_title
      t.text :requirements
      t.text :description
      t.text :note
      t.date :last_date, :null => false

      t.timestamps
    end
  end
end
