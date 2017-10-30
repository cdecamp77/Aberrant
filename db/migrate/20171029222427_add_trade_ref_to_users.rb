class AddTradeRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :trade, foreign_key: true
  end
end
