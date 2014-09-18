module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      if user_signed_in?
      	if !current_user.cart.nil?
      		@cart = current_user.cart
      	else
      		@cart = Cart.create(user_id: current_user.id)
      	end
      else
      	@cart = Cart.find(session[:cart_id])
      end
    rescue ActiveRecord::RecordNotFound
      	@cart = Cart.create
	      session[:cart_id] = @cart.id
    end

end