class AddUsidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :usid, :integer
  end
end
