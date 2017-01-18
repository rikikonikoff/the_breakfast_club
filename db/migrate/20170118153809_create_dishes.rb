class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.belongs_to :creator, class_name: :User

      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
