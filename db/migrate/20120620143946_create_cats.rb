class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.date :birthday
      t.string :breed
      t.text :description
      t.integer :member_id

      t.timestamps
    end
  end
end
