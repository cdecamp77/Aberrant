class Trade < ApplicationRecord
    belongs_to :users
    has_many :offers
end
