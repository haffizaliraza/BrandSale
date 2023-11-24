class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :url
      t.string :products
      t.string :image
      t.string :product_titile
      t.string :old_price
      t.string :new_price
      t.string :product_url
      t.string :brand_name

      t.timestamps
    end
  end
end
