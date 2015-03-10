class ShowcaseController < ApplicationController
  include CurrentCart
  before_action :set_cart
end
