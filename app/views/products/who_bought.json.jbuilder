json.product @product, :title, :description, :image_url, :price
# @product.orders.each do |order|
#   order.line_items.each do |item|
#     json.title item.product.title
#     json.description item.product.description
#     json.quantity item.quantity
#     json.price item.total_price
#   end
# end

json.orders @product.orders do |order|
  json.order order, :id, :name, :address, :email, :created_at
  json.merge! ({ "pay_type": PayType.find(order.id).pay_type })
end