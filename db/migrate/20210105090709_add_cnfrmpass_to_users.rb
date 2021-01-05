class AddCnfrmpassToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cnfrmpass, :string
  end
end
