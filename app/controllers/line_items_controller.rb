class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]  # This line makes sure that a cart is created when the "Add to cart" button is pressed.
  before_action :set_line_item, only: [:show, :edit, :update, :destroy] # The generated controller already uses this facility to set the value of the @line_item instance variable before the show() , edit() , update(), or destroy() actions are called.

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id]) # use the params object to get the :product_id parameter from the request
    @line_item = @cart.add_product(product.id)  # @cart comes from set_cart, and @line_item comes from set_line_item created by default

    #@line_item = @cart.line_items.build(product: product)  # This causes a new line item relationship to be built between the @cart object and the product. You can build the relationship from either end, and Rails will take care of establishing the connections on both sides. We save the resulting line item into an instance variable named @line_item. NOT FULLY UNDERSTOOD!

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @line_item }
        format.js   { @current_item = @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    flash[:info] = 'Your cart just got emptied, go get some more books!' if @line_item.cart.line_items.empty?
    respond_to do |format|
      format.html { redirect_to store_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
