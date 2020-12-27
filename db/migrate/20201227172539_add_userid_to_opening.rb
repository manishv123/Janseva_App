class AddUseridToOpening < ActiveRecord::Migration[6.0]
  def change
    add_column :openings, :userid, :integer
  end
end
