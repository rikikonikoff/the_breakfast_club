class FixVotingReviews3 < ActiveRecord::Migration[5.0]
  def up
    remove_column :votes, :vote_value
  end

  def down
    add_column :votes, :value, :integer
  end
end
