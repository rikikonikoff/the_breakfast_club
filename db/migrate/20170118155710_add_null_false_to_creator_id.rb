class AddNullFalseToCreatorId < ActiveRecord::Migration[5.0]
  def change
    change_column_null :dishes, :creator_id, false
  end
end
