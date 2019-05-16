class OrderMailer < ApplicationMailer
  default from: 'reply@jungle.com'

  def order_email(order)
    @order = order
    @url  = "http://localhost:3000/orders/#{@order.id}"
    mail(to: @order.email, subject: "Order: #{@order.id}")
  end
end