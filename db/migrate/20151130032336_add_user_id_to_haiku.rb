class AddUserIdToHaiku < ActiveRecord::Migration
  def change
    add_column :haikus, :user_id, :integer
    remove_column :haikus, :compGen, :boolean
  end
end
