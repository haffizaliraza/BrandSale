Product.delete_all
Site.delete_all
sites = [
    {
      "url": "https://www.chinyere.pk/collections/sale",
      "products": "div.product-collection.products-grid.row",
      "image": "img.pr-swp-img",
      "product_titile": "a.product-title",
      "old_price": "span.old-price",
      "new_price": "span.special-price",
      "product_url": "a.product-title",
      "brand_name": "Chinyere",
      "image_attribute": "src"
    },
    {
      "url": "https://pk.khaadi.com/sale/",
      "products": "div.row.product-grid.plp-products-wrapper",
      "image": "img.hover-image.card-img-top",
      "product_titile": "h2.pdp-link-heading",
      "old_price": "span.value.cc-price",
      "new_price": "value cc-price",
      "product_url": "a",
      "brand_name": "khaadi",
      "image_attribute": "src"
    },
    {
      "url": "https://www.leisureclub.pk/collections/sale",
      "products": "div.collection-row.use_align_height.height_330px",
      "image": "img.nz-img-1.lazyload.blur-up.product-thumb-img",
      "product_titile": "h5.product-thumb-caption-title",
      "old_price": "span.compare-price.money",
      "new_price": "span.money",
      "product_url": "a",
      "brand_name": "LeisureClub",
      "image_attribute": "data-src"
    },
    {
      "url": "https://pepperland.pk/collections/sale",
      "products": "div.product-collection.products-grid.row",
      "image": "img",
      "product_titile": "h2",
      "old_price": "span.money",
      "new_price": "span.old-price",
      "product_url": "a",
      "brand_name": "Pepperland",
      "image_attribute": "data-src"
    },
    {
      "url": "https://www.gulahmedshop.com/sale",
      "products": "ol.products.list.items.product-items.same-height",
      "image": "img",
      "product_titile": "span.product-item-link",
      "old_price": "span.price",
      "new_price": "span.price",
      "product_url": "a",
      "brand_name": "GulAhmed",
      "image_attribute": "data-desk-owlsrc"
    },
    {
      "url": "https://www.bareeze.com/pk/sale.html",
      "products": "ol.products.list.items.product-items",
      "image": "img.product-image-photo",
      "product_titile": "a.product-item-link",
      "old_price": "span.onsale span.price",
      "new_price": "span.price-wrapper span.price",
      "product_url": "a.product-item-link",
      "brand_name": "Bareeze",
      "image_attribute": "src"
    },
    {
      "url": "https://www.minnieminors.com/collections/sale",
      "products": "div.product-collection.products-grid.row",
      "image": "img",
      "product_titile": "a.product-title",
      "old_price": "span.old-price span.money",
      "new_price": "span.special-price span.money",
      "product_url": "a.product-grid-image",
      "brand_name": "MinnieMinors",
      "image_attribute": "src"
    },
    {
      "url": "https://www.sanasafinaz.com/pk/sale.html",
      "products": "ol.products.list.items.product-items",
      "image": "img.product-image-photo",
      "product_titile": "a.product-item-link",
      "old_price": "span.old-price span.price",
      "new_price": "span.special-price span.price",
      "product_url": "a.product-item-link",
      "brand_name": "sanasafinaz",
      "image_attribute": "src"
    },
    {
      "url": "https://mannatclothing.com/collections/sale",
      "products": "div.grid.grid--uniform",
      "image": "img",
      "product_titile": "div.grid-product__title.grid-product__title--body",
      "old_price": "span.money",
      "new_price": "span.money",
      "product_url": "a.grid-product__link",
      "brand_name": "MannatClothing",
      "image_attribute": "src"
    },
    {
      "url": "https://www.khasstores.com/collections/sale",
      "products": "div.t4s_box_pr_grid.t4s-products.t4s-text-center.t4s_ratio2_3.t4s_position_8.t4s_cover.t4s-row.t4s-justify-content-center.t4s-row-cols-2.t4s-row-cols-md-2.t4s-row-cols-lg-4.t4s-gx-md-6.t4s-gy-md-30.t4s-gx-10.t4s-gy-10",
      "image": "img",
      "product_titile": "h3.t4s-product-title a",
      "old_price": "span.money",
      "new_price": "span.money",
      "product_url": "h3.t4s-product-title a",
      "brand_name": "khasstores",
      "image_attribute": "data-src"
    },
    {
      "url": "https://www.gulljee.com/collections/sale",
      "products": "div.grid.grid--no-gutters.grid--uniform",
      "image": "img.product-card__image",
      "product_titile": "div.product-card__name",
      "old_price": "s.product-card__regular-price",
      "new_price": "span.visually-hidden",
      "product_url": "a",
      "brand_name": "Gulljee",
      "image_attribute": "src"
    },
    {    
    "url": "https://shop.ethnic.pk/collections/sale",
    "products": "ul",
    "image": "img",
    "product_titile": "a.full-unstyled-link",
    "old_price": "span.money",
    "new_price": "span.money",
    "product_url": "a",
    "brand_name": "ethnic",
    "image_attribute": "src"
  }
  ]
sites.each do |site|
    Site.create(url: site[:url], products: site[:products], image: site[:image], product_titile: site[:product_titile], old_price: site[:old_price], new_price: site[:new_price], product_url: site[:product_url], brand_name: site[:brand_name], image_attribute: site[:image_attribute])
end
site_list = Site.all
site_list.each do |site|
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

Product.where(brand: "LeisureClub").update(discount: 20)
Product.where(brand: "Chinyere").update(discount: 40)
Product.where(brand: "Pepperland").update(discount: 30)
Product.where(brand: "GulAhmed").update(discount: 40)
Product.where(brand: "Bareeze").update(discount: 15)
Product.where(brand: "sanasafinaz").update(discount: 20)
Product.where(brand: "MannatClothing").update(discount: 30)
Product.where(brand: "Gulljee").update(discount: 20)