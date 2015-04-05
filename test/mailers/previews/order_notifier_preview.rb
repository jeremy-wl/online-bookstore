# Preview all emails at http://localhost:3000/rails/mailers/order_notifier
class OrderNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/shipped
  def shipped
    # Use the first order of the last user as the order info for the preview mail,
    # OrderNotifier.shipped is the method defined in the mailer
    @order = User.last.orders.first
    OrderNotifier.shipped(@order)
  end

end
