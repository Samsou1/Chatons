class Admins::ItemsController < ApplicationController
  # before_action :authenticate_admin!
  def show
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(title: params[:title], description: params[:description], price: params[:price])
    if @item.save
      redirect_to admins_index_path
    else
      redirect_to admins_items_new_path
    end
  end

  def edit; end

  def update; end

  def destroy
    Item.find(params[:id])
  end
end
