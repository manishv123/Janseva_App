class AddUidToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :uid, :integer
  end
end
