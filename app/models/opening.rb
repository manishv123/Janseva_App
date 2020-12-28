class Opening < ApplicationRecord
    has_many :feedbacks
    validates :body, presence: true, length: { minimum: 10 }
end
