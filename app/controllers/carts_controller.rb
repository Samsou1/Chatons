class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index show new edit create update destroy]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
    # WARNING: THE CART SHOWED IN /CART IS MADE BY THE STATIC CONTROLER METHOD CART
    @cart = Cart.find_by(user_id: current_user.id)
    @cartitems = Cartitem.where(cart_id: @cart.id)
    @items = []
    @total_price = 0
    @cartitems.each do |cartitem|
      item = Item.find(cartitem.item_id)
      @items.push(item)
      @total_price += item.price
    end
    # @cart is the cart of the current user
    # @total_price is the total price of the cart
    # @items is the array of items in the cart of the current user
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart = Cart.find(user_id: current_user.id)
    @cart.destroy
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end
end
