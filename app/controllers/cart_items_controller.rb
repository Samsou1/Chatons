class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def create; end

  def destroy; end
end
