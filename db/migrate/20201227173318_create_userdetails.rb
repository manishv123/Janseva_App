class CreateUserdetails < ActiveRecord::Migration[6.0]
  def change
    create_table :userdetails do |t|
      t.integer :uuid
      t.string :name
      t.string :gender
      t.integer :age
      t.text :address
      t.integer :pincode
      t.integer :phone
      t.integer :aadhaar
    end
  end
end
