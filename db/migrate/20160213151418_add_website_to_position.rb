class AddWebsiteToPosition < ActiveRecord::Migration
  def change
    add_reference :positions, :website, index: true, foreign_key: true
  end
end
