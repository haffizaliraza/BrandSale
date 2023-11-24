
Product.delete_all
sites = Site.all
sites.each do |site|
    response = HTTParty.get(site.url)
    document = Nokogiri::HTML(response.body)
    html_products = document.css(site.products)
    html_products.children.each do |html_product|
        if html_products.to_s.length > 50
        begin
            url = html_product.css(site.product_url).first.attribute("href").value 
        rescue => e
            # Handle the exception
            puts "url cant found: An error occurred: #{e.message}"
        end
        begin
            image = html_product.css(site.image).attribute(site.image_attribute).value
            image = "https://" + image[2..-1] if image.start_with?("//")
        rescue => e
            # Handle the exception
            puts "image cant found: An error occurred: #{e.message}"
        end
        begin
            name = html_product.css(site.product_titile).first.text 
        rescue => e
            # Handle the exception
            puts "title cant found: An error occurred: #{e.message}"
        end
        begin
            old_price = html_product.css(site.old_price).first.text 
        rescue => e
            # Handle the exception
            puts "old price cant found: An error occurred: #{e.message}"
        end
        begin
            new_price = html_product.css(site.new_price).first.text 
        rescue => e
            # Handle the exception
            puts "new price cant found: An error occurred: #{e.message}"
        end
        if(url and image and name and old_price and new_price)
            Product.create(name: name, url: url, image: image, price: old_price, brand: site.brand_name, after_discount_price: new_price)
        end
    end
end
end
