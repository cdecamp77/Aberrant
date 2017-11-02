class AddOfferRefToTrades < ActiveRecord::Migration[5.1]
  def change
    add_reference :trades, :offer, foreign_key: true
  end
end
