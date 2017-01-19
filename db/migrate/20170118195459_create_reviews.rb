class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :dish, null: false
      t.belongs_to :user, null: false

      t.integer :rating, null: false
      t.text :body

      t.timestamps
    end
  end
end
