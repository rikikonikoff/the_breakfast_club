class FixVotingReviews < ActiveRecord::Migration[5.0]
  def up
    remove_column :reviews, :upvote_count
    remove_column :reviews, :downvote_count
    remove_column :reviews, :net_votes
  end

  def down
    add_column :reviews, :sum_votes
  end
end
