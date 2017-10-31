class Trade < ApplicationRecord
    belongs_to :user
    has_many :offers, dependent: :destroy

    validates :title, :description, :image, presence: true

    has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def closed
        Offer.exists?(trade: self, accepted: true)
    end

end
