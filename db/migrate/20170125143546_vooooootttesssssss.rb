class Vooooootttesssssss < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :sum_votes, :integer, default: 0, null: false
  end
end
