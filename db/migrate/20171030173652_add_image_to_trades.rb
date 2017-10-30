class AddImageToTrades < ActiveRecord::Migration[5.1]
  def change
    add_attachment :trades, :image
  end
end
