class User < ApplicationRecord
    before_save {self.email=email.downcase}
    validates :username, presence: true,
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 3,maximum: 20}
    validates :email, presence: true,
    uniqueness: {case_sensitive: false}, 
    length: {maximum: 100}
    has_secure_password
end