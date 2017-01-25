class FixVotingReviews4 < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :value, :integer
  end
end
