class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :trade_name
      t.text :description
      t.attachment :trade_image

      t.timestamps
    end
  end
end
