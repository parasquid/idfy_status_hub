class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :id_api
      t.text :status
      t.integer :ethnicity
      t.integer :weight
      t.integer :height
      t.boolean :is_veg
      t.boolean :drink
      t.date :dob
      t.string :image

      t.timestamps null: false
    end
    add_index :members, :status
    add_index :members, :ethnicity
    add_index :members, :height
    add_index :members, :id_api, unique: true
  end
end
