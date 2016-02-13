class AddKeywordToPositions < ActiveRecord::Migration
  def change
    add_reference :positions, :keyword, index: true, foreign_key: true
  end
end
