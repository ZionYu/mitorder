class UserMailer < ApplicationMailer
  default from: "Studio M <ialways0311@gmail.com>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"

    mail to: order.email,
    subject: "Studio M | 訂購明細"
  end
end
