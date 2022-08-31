class Admins::ItemsController < ApplicationController
  # before_action :authenticate_admin!
  def show
    @adminitems = Item.all
  end

  def new
    @adminitem = Item.new
  end

  def create
    @adminitem = Item.new(title: params[:title], description: params[:description], price: params[:price],
                          image_url: params[:image_url])
    if @adminitem.save
      redirect_to admins_index_path
    else
      redirect_to admins_items_new_path
    end
  end

  def edit; end

  def update; end

  def destroy
    Item.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to admins_items_show_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @adminitem = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:adminitem).permit(:title, :description, :price, :image_url)
  end
end
