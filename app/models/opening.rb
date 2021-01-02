class Opening < ApplicationRecord
    has_many :feedbacks

    validates :title, presence:true
    validates :description, presence:true
    validates :vacancy, presence:true
end
