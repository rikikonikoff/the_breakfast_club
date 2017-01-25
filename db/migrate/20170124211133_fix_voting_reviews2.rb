class FixVotingReviews2 < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :sum_votes, :integer
  end
end
