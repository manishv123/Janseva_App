class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :userid
      t.integer :opid
      t.text :feedback

      t.timestamps
    end
  end
end
