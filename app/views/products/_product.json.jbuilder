json.extract! product, :id, :name, :url, :image, :price, :discount, :after_discount_price, :created_at, :updated_at
json.url product_url(product, format: :json)
