class OrderItemsController < ApplicationController
  def create; end

  def destroy
    @orderitem = orderitem.find_by(id: params[:id])
    if @orderitem.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {}
      end
    end
  end
end
