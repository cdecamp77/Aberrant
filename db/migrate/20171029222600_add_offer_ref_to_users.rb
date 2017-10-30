class AddOfferRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :offer, foreign_key: true
  end
end
