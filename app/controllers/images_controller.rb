class ImagesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.image.attach(params[:image])
    redirect_to(item_path(@item))
  end
end
