class AddPutedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :puted_at, :datetime
  end
end
