class RemoveLikesFromHaikus < ActiveRecord::Migration
  def change
    remove_column :haikus, :likes, :integer
  end
end
