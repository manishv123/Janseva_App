class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :uid
      t.text :body
      t.references :opening, null: false, foreign_key: true

      t.timestamps
    end
  end
end
