json.extract! site, :id, :url, :products, :image, :product_titile, :old_price, :new_price, :product_url, :brand_name, :created_at, :updated_at
json.url site_url(site, format: :json)
