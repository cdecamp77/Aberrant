class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :user_name
      t.text :input
      t.attachment :image

      t.timestamps
    end
  end
end
