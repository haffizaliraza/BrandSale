class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.string :image
      t.string :price
      t.string :discount
      t.string :after_discount_price

      t.timestamps
    end
  end
end
