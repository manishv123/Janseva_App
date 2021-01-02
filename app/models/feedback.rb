class Feedback < ApplicationRecord
  belongs_to :opening
  validates :body, presence:true
end
