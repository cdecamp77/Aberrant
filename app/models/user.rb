class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    has_many :trades
    has_many :offers, through: :trades
end
