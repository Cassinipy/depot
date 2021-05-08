xml.instruct!
xml.information do
  xml.product do
    xml.title @product.title
    xml.description @product.description
    xml.image_url @product.image_url
    xml.price @product.price
  end
  
  @product.orders.each do |order|
    xml.orders do
      xml.name order.name
      xml.address order.address
      xml.email order.email
      xml.paytype PayType.find(order.id).pay_type
    end
  end
end