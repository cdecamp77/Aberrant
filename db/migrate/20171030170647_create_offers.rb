class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.text :content
      t.boolean :accepted
      t.references :user, foreign_key: true
      t.references :trade, foreign_key: true

      t.timestamps
    end
  end
end
