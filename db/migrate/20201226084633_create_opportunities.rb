class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.integer :uid
      t.integer :opid
      t.boolean :status

      t.timestamps
    end
  end
end
