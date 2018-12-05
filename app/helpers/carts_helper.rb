module CartsHelper
  def render_cart_total(cart)
    sum = 0
    cart.cart_items.each do |cart_item|
      sum += cart_item.quantity if cart_item.quantity.present?
    end
    sum
  end
end
